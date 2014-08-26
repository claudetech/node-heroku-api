_ = require 'lodash'

# DELETE /apps/:app
exports.deleteApp = (app, callback) ->
  @request
    expects:   200
    method:  'delete'
    path:    "/apps/#{app}"
  , callback

# GET /apps
exports.getApps = (callback) ->
  @request
    path: '/apps'
    method: 'get'
    expects: 200
  , callback

# GET /apps/:app
exports.getApp = (app, callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/apps/#{app}"
  , callback

# GET /apps/:app/server/maintenance
exports.getAppMaintenance = (app, callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/apps/#{app}/server/maintenance"
  , callback

# POST /apps
exports.postApp = (params={}, callback) ->
  [params, callback] = [{}, params] if _.isFunction(params)
  @request
    expects: 202
    method:  'post'
    path:    '/apps'
    qs:   @_appParams(params)
  , callback

# POST /apps/:app/server/maintenance
exports.postAppMaintenance = (app, maintenanceMode) ->
  @request
    expects:  200
    method:  'post'
    path:    "/apps/#{app}/server/maintenance"
    qs:      { maintenance_mod:  maintenanceMode }

# PUT /apps/:app
exports.putApp = (app, params, callback) ->
  @request
    expects: 200
    method:  'put'
    path:    "/apps/#{app}"
    qs:      @_appParams(params)

exports._appParams = (params) -> @_wrapParamKeys params, 'app'
