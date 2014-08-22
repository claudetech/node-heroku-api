# DELETE /apps/:app/domains/:domain
exports.deleteDomain = (app, domain, callback) ->
  @request
    expects: 200
    method:  'delete'
    path:    "/apps/#{app}/domains/#{escape(domain)}"
  , callback


# DELETE /apps/:app/domains
exports.deleteDomains = (app, callback) ->
  @request
    expects: 200
    method:  'delete'
    path:    "/apps/#{app}/domains"
  , callback


# GET /apps/:app/domains
exports.getDomains = (app, callback) ->
  @request
    expects: 200
    method:  'get'
    path:    "/apps/#{app}/domains"
  , callback


# POST /apps/:app/domains
exports.postDomain = (app, domain, callback) ->
  @request
    expects: 201
    method:  'post'
    path:    "/apps/#{app}/domains",
    qs:   { 'domain_name[domain]': domain }
  , callback
