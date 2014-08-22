_ = require 'lodash'

# GET /apps/:app/logs
exports.getLogs = (app, options, callback) ->
  [options, callback] = [{}, options] if _.isFunction(options)
  _.extend { logplex: true }, options
  @request
    expects: 200
    method:  'get'
    path:    "/apps/#{app}/logs"
    qs:   options
  , callback
