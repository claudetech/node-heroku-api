request = require 'request'
_       = require 'lodash'
path    = require 'path'

defaults = require './defaults'

class HerokuApi
  constructor: (options={}, callback) ->
    headers  = _.extend {}, options.headers, defaults.headers
    options = _.extend options, defaults.options, { headers: headers }
    @url = "#{options.scheme}://#{options.host}"
    if options.apiKey?
      @_makeAuth options.apiKey
      @request = request.defaults options
    else if options.username? && options.password?
      @_makeLogin options, callback
    else
      throw new Exception("You need to give username/password or apiKey.")

  _getAuthHeader: (apiKey) ->
    signature = new Buffer(":#{apiKey}").toString('base64').replace('\n', '')
    "Basic #{signature}"

  _sendRequest: (options, callback) ->
    options.url = @url + options.url
    @request options, callback

_.each ['login', 'apps'], (module) ->
  _.each require(path.join(__dirname, module)), (method, key) ->
    HerokuApi.prototype[key] = method

module.exports = HerokuApi
