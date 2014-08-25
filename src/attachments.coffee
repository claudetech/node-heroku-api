# GET /apps/:app/attachments
exports.getAttachments = (app, callback) ->
  @request
    expects: 200
    method: 'get'
    path:   "/apps/#{app}/attachments"
  , callback
