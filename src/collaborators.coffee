# DELETE /apps/:app/collaborators/:email
exports.deleteCollaborator = (app, email, callback) ->
  @request
    expects: 200
    method: 'delete'
    path:   "/apps/#{app}/collaborators/#{CGI.escape(email)}"
  , callback


# GET /apps/:app/collaborators
exports.getCollaborators = (app, callback) ->
  @request
    expects: 200
    method: 'get'
    path:   "/apps/#{app}/collaborators"
  , callback


# POST /apps/:app/collaborators
exports.postCollaborator = (app, email, callback) ->
  @request
    expects: [200, 201]
    method: 'post'
    path:   "/apps/#{app}/collaborators"
    qs:  { 'collaborator[email]': email }
  , callback
