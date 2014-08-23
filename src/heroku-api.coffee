request = require 'request'
path    = require 'path'

_        = require './lodash-wrapper'
defaults = require './defaults'
errors   = require './errors'

class HerokuApi
  constructor: (options={}, callback) ->
    headers  = _.extend {}, options.headers, defaults.headers
    options = _.extend options, defaults.options, { headers: headers }
    @url = "#{options.scheme}://#{options.host}"
    if options.apiKey?
      @_makeAuth options.apiKey, options
    else if options.username? && options.password?
      @_makeLogin options, callback

  _makeAuth: (apiKey, options) ->
    signature = new Buffer(":#{apiKey}").toString('base64').replace('\n', '')
    "Basic #{signature}"
    options.headers.Authorization = signature
    @_request = request.defaults options

  request: (options, callback) ->
    options.url = @url + _.delete(options, 'path')
    expects = _.delete options, 'expects'
    expects = [expects] unless _.isArray(expects)
    @_request options, (err, response, body) ->
      if err != null
        callback new errors.HerokuError(err.message), null
      else if response.statusCode not in expects
        callback errors._getError(response, body), body
      else
        callback null, body, response

  _wrapParamKeys = (params, wrapper) ->
    newParams = {}
    _.each params, (value, key) ->
      newParams["#{wrapper}[#{key}]"] = value
    newParams

_.each [
  'addons', 'apps', 'attachments', 'collaborators'
  'config-vars', 'domains', 'features', 'keys'
  'login', 'logs', 'processes', 'releases'
  'ssl-endpoints', 'stacks', 'user'
], (module) ->
  _.each require(path.join(__dirname, module)), (method, name) ->
    HerokuApi.prototype[name] = method

_.each errors, (method, name) ->
  HerokuApi[name] = method unless name[0] == '_'

module.exports = HerokuApi
