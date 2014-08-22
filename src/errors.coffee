class HerokuError extends Error
  constructor: (@message, @code, @id) ->
    super @message

class BadRequestError extends HerokuError
  constructor: (@message="request invalid, validate usage and try again", @id="bad_request") ->
    super @message, 400, @id

class UnauthorizedError extends HerokuError
  constructor: (@message="request not authenticated, API token is missing, invalid or expired", @id="unauthorized") ->
    super @message, 401, @id

class PaymentRequiredError extends HerokuError
  constructor: (@message="either the account has become delinquent as a result of non-payment, or the account’s payment method must be confirmed to continue", @id="delinquent") ->
    super @message, 402, @id

class ForbiddenError extends HerokuError
  constructor: (@message="request not authorized, provided credentials do not provide access to specified resource", @id="forbidden") ->
    super @message, 403, @id

class SuspendedError extends HerokuError
  constructor: (@message="request not authorized, account or application was suspended.", @id="suspended") ->
    super @message, 403, @id

class NotFoundError extends HerokuError
  constructor: (@message="request failed, the specified resource does not exist", @id="not_found") ->
    super @message, 404, @id

class NotAcceptableError extends HerokuError
  constructor: (@message="request failed, set Accept: application/vnd.heroku+json; version=3 header and try again", @id="not_acceptable") ->
    super @message, 406, @id

class RequestedRangeError extends HerokuError
  constructor: (@message="request failed, validate Content-Range header and try again", @id="requested_range_not_satisfiable") ->
    super @message, 416, @id

class InvalidParamsError extends HerokuError
  constructor: (@message="request failed, validate parameters try again", @id="invalid_params") ->
    super @message, 422, @id

class VerificationNeededError extends HerokuError
  constructor: (@message="request failed, enter billing information in the Heroku Dashboard before utilizing resources.", @id="verification_needed") ->
    super @message, 422, @id

class TooManyRequestsError extends HerokuError
  constructor: (@message="request failed, wait for rate limits to reset and try again, see rate limits", @id="rate_limit") ->
    super @message, 429, @id

class InternalServerError extends HerokuError
  constructor: (@message="error occurred, we are notified, but contact support if the issue persists", @id="") ->
    super @message, 500, @id

class ServiceUnavailableError extends HerokuError
  constructor: (@message="API is unavailable, check response body or Heroku status for details", @id="") ->
    super @message, 503, @id

getErrorByCode = (code) ->
  switch code
    when 400 then new BadRequestError()
    when 401 then new UnauthorizedError()
    when 402 then new PaymentRequiredError()
    when 403 then new ForbiddenError()
    when 404 then new NotFoundError()
    when 406 then new NotAcceptableError()
    when 416 then new RequestedRangeError()
    when 422 then new InvalidParamsError()
    when 429 then new TooManyRequestsError()
    when 500 then new InternalServerError()
    when 503 then new ServiceUnavailableError()
    else new HerokuError()

getErrorById = (id) ->
  switch id
    when 'bad_request' then new BadRequestError()
    when 'unauthorized' then new UnauthorizedError()
    when 'delinquent' then new PaymentRequiredError()
    when 'forbidden' then new ForbiddenError()
    when 'suspended' then new ForbiddenError()
    when 'not_found' then new NotFoundError()
    when 'not_acceptable' then new NotAcceptableError()
    when 'requested_range_not_satisfiable' then new RequestedRangeError()
    when 'invalid_params' then new InvalidParamsError()
    when 'verification_needed' then new InvalidParamsError()
    when 'rate_limit' then new TooManyRequestsError()
    else new HerokuError()

getError = (response, body) ->
  if body?.id?
    error = getErrorById body.id
    error.message = body.error if error.message?
    error
  else
    getErrorByCode response.statusCode

module.exports =
  HerokuError: HerokuError
  BadRequestError: BadRequestError
  UnauthorizedError: UnauthorizedError
  PaymentRequiredError: PaymentRequiredError
  ForbiddenError: ForbiddenError
  SuspendedError: SuspendedError
  NotFoundError: NotFoundError
  NotAcceptableError: NotAcceptableError
  RequestedRangeError: RequestedRangeError
  InvalidParamsError: InvalidParamsError
  VerificationNeededError: VerificationNeededError
  TooManyRequestsError: TooManyRequestsError
  InternalServerError: InternalServerError
  ServiceUnavailableError : ServiceUnavailableError
  getErrorById: getErrorById
  getErrorByCode: getErrorByCode
  _getError: getError
