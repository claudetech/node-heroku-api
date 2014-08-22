# DELETE /apps/:app/config_vars/:key
exports.deleteConfigVar = (app, key, callback) ->
  @request
    expects: 200
    method:  'delete'
    path:    "/apps/#{app}/config_vars/#{escape(key)}"
  , callback


# GET /apps/:app/config_vars
exports.getConfigVars = (app, callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/apps/#{app}/config_vars"
  , callback


# PUT /apps/:app/config_vars
exports.putConfigVars = (app, vars, callback) ->
  @request
    body:    vars
    expects: 200
    method:  'put'
    path:    "/apps/#{app}/config_vars"
  , callback
