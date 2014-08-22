request = require 'request'
_       = require './lodash-wrapper'

exports._makeLogin = (options, callback) ->
  username = _.delete options, 'username'
  password = _.delete options, 'password'
  @_request = request.defaults options
  @login username, password, (err, body) =>
    if err == null
      @_makeAuth body.api_key, options
    callback(err, this) if callback?

exports.login = (username, password, callback) ->
  @request
    path: '/login'
    method: 'post'
    expects: 200
    qs: { username: username, password: password }
  , callback
