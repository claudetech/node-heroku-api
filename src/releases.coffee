_ = require 'lodash'

# GET /apps/:app/releases
exports.getReleases = (app, callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/apps/#{app}/releases"
  , callback


# GET /apps/:app/releases/:release
exports.getRelease = (app, release, callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/apps/#{app}/releases/#{release}"
  , callback


# POST /apps/:app/releases/:release
exports.postRelease = (app, release, callback) ->
  [release, callback] = [null, release] if _.isFunction(release)
  @request
    expects: 200
    method:  'post'
    path:    "/apps/#{app}/releases"
    qs:   { rollback: release }
  , callback
