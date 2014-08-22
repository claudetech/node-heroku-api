_ = require 'lodash'

# DELETE /apps/:app/addons/:addon
exports.deleteAddon = (app, addon, callback) ->
  @request
    expects: 200
    method:  'delete'
    path:    "/apps/#{app}/addons/#{addon}"
  , callback


# GET /addons
# GET /apps/:app/addons
exports.getAddons = (app, callback) ->
  [app, callback] = [undefined, app] if _.isFunction(app)
  path = if app? then "/apps/#{app}/addons" else "/addons"
  @request
    expects: 200
    method:  'get'
    path:    path
  , callback


# POST /apps/:app/addons/:addon
exports.postAddon = (app, addon, config = {}, callback) ->
  @request
    expects: 200
    method:  'post'
    path:    "/apps/#{app}/addons/#{addon}"
    qs:   @_addonParams(config)
  , callback


# PUT /apps/:app/addons/:addon
exports.putAddon = (app, addon, config = {}, callback) ->
  @request
    expects: 200
    method:  'put'
    path:    "/apps/#{app}/addons/#{addon}"
    qs:   @_addonParams(config)
  , callback


exports._addonParams = (params) -> @_wrapParamKeys params, 'config'
