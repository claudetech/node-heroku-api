_ = require 'lodash'

# DELETE /features/:feature
exports.deleteFeature = (feature, app, callback) ->
  [app, callback] = [null, app] if _.isFunction(app)
  @request
    expects: 200
    method:  'delete'
    path:    "/features/#{feature}"
    qs:   { app: app }
  , callback


# GET /features
exports.getFeatures = (app, callback) ->
  [app, callback] = [null, app] if _.isFunction(app)
  @request
    expects: 200
    method:  'get'
    path:    "/features"
    qs:   { app: app }
  , callback


# GET /features/:feature
exports.getFeature = (feature, app, callback) ->
  [app, callback] = [null, app] if _.isFunction(app)
  @request
    expects: 200
    method:  'get'
    path:    "/features/#{feature}"
    qs:   { app: app }
  , callback


# POST /features/:feature
exports.postFeature = (feature, app, callback) ->
  [app, callback] = [null, app] if _.isFunction(app)
  @request
    expects: [200, 201]
    method:  'post'
    path:    "/features/#{feature}"
    qs:   { app: app }
  , callback
