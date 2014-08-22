# GET /user
exports.getUser = (callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/user"
  , callback
