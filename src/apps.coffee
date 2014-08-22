exports.getApps = (callback) ->
  @_sendRequest
    url: '/apps'
    method: 'get'
  , callback
