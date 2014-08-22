# DELETE /user/keys/:key
exports.deleteKey = (key, callback) ->
  @request
    expects: 200
    method:  'delete'
    path:    "/user/keys/#{escape(key)}"
  , callback


# DELETE /user/keys
exports.deleteKeys = (callback) ->
  @request
    expects: 200
    method:  'delete'
    path:    "/user/keys"
  , callback


# GET /user/keys
exports.getKeys = (callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/user/keys"
  , callback


# POST /user/keys
exports.postKey = (key, callback) ->
  @request
    body:    key
    expects: 200
    method:  'post'
    path:    "/user/keys"
  , callback
