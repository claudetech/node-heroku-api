request = require 'request'
_       = require './lodash-wrapper'

exports._makeLogin = (options, callback) ->
  username = _.delete options, 'username'
  password = _.delete options, 'password'
  @request = request.defaults options
  @login username, password, (err, response, body) =>
    options.headers.Authorization = @_getAuthHeader(body.api_key)
    @request = request.defaults options
    callback(err, this) if callback?

exports.login = (username, password, callback) ->
  @_sendRequest
    url: '/login'
    method: 'post'
    qs: { username: username, password: password }
  , callback
