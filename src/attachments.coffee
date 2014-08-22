# GET /apps/:app/attachments
exports.get_attachments = (app, callback) ->
  @request
    expects: 200
    method: 'get'
    path:   "/apps/#{app}/attachments"
  , callback
