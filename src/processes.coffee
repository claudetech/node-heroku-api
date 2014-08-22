_ = require 'lodash'

# GET /apps/:app/ps
exports.getPs = (app, callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/apps/#{app}/ps"
  , callback

# POST /apps/:app/ps
exports.postPs = (app, command, options, callback) ->
  [options, callback] = [{}, options] if _.isFunction(options)
  options = _.extend { command: command }, options
  @request
    expects: 200
    method:  'post'
    path:    "/apps/#{app}/ps",
    qs:      ps_options(options)
  , callback

# POST /apps/:app/ps/restart
exports.postPsRestart = (app, options, callback) ->
  [options, callback] = [{}, options] if _.isFunction(options)
  @request
    expects: 200
    method:  'post'
    path:    "/apps/#{app}/ps/restart",
    qs:      options
  , callback

# POST /apps/:app/ps/scale
exports.postPsScale = (app, type, quantity, callback) ->
  @request
    expects: 200
    method:  'post'
    path:    "/apps/#{app}/ps/scale"
    qs:
      type: type
      qty:  quantity
  , callback

# POST /apps/:app/ps/stop
exports.postPsStop = (app, options, callback) ->
  [options, callback] = [{}, options] if _.isFunction(options)
  @request
    expects: 200
    method:  'post'
    path:    "/apps/#{app}/ps/stop"
    qs:      options
  , callback

# PUT /apps/:app/dynos
exports.putDynos = (app, dynos, callback) ->
  @request
    expects: 200
    method:  'put'
    path:    "/apps/#{app}/dynos"
    qs:      { dynos: dynos}
  , callback

# PUT /apps/:app/workers
exports.putWorkers = (app, workers, callback) ->
  @request
    expects: 200
    method:  'put'
    path:    "/apps/#{app}/workers"
    qs:      { workers: workers }
  , callback

# PUT /apps/:app/formation
exports.putFormation = (app, options, callback) ->
  [options, callback] = [{}, options] if _.isFunction(options)
  _.each options, (process, size) -> options[process] = { size: size }
  @request
    body:    options
    expects: 200
    method:  'put'
    path:    "/apps/#{app}/formation"
  , callback

# GET /apps/:app/dyno-types
exports.getDynoTypes = (app, callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/apps/#{app}/dyno-types"
  , callback
