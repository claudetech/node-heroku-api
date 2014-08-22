# DELETE /apps/:app/ssl-endpoint/:cname
exports.deleteSslEndpoint = (app, cname, callback) ->
  @request
    expects: 200
    method:  'delete'
    path:    "/apps/#{app}/ssl-endpoints/#{escape(cname)}"
  , callback


# GET /apps/:app/ssl-endpoint/:cname
exports.getSslEndpoint = (app, cname, callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/apps/#{app}/ssl-endpoints/#{escape(cname)}"
  , callback


# GET /apps/:app/ssl-endpoints
exports.getSslEndpoints = (app, callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/apps/#{app}/ssl-endpoints"
  , callback


# POST /apps/:app/ssl-endpoints
exports.postSslEndpoint = (app, pem, key, callback) ->
  @request
    expects: 200
    method:  'post'
    path:    "/apps/#{app}/ssl-endpoints"
    qs:   { key: key, pem: pem }
  , callback


# POST /apps/:app/ssl-endpoints/:cname/rollback
exports.postSslEndpointRollback = (app, cname, callback) ->
  @request
    expects: 200
    method:  'post'
    path:    "/apps/#{app}/ssl-endpoints/#{escape(cname)}/rollback"
  , callback


# PUT /apps/:app/ssl-endpoints/:cname
exports.putSslEndpoint = (app, cname, pem, key, callback) ->
  @request
    expects: 200
    method:  'put'
    path:    "/apps/#{app}/ssl-endpoints/#{escape(cname)}"
    qs:   { key: key, pem: pem }
  , callback

