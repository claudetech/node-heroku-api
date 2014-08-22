exports.getStack = (app, callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/apps/#{app}/stack"
  , callback


exports.putStack = (app, stack, callback) ->
  @request
    body:    stack
    expects: 200
    method:  'put'
    path:    "/apps/#{app}/stack"
  , callback
