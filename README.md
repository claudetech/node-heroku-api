# node-heroku-api

Port of [heroku-api gem](https://github.com/heroku/heroku.rb) to NodeJS.

The API is exactly the same, with the following differences:

* All the methods take a callback of the following form: `function (err, body)`
  where `err` is one of the error defined in `src/errors.coffee` if any, or `null` otherwise and `body` is the JSON response.
* All the methods are camelCased.
* When using the `username/password` constructor, the object should be used
  in the callback, and not as the return value.


Here is a short example (in CoffeeScript).

With username/password:

```coffee
new HerokuApi username: 'test@foo.jp', password: 'password', (err, api) ->
  return handleError(err) unless err == null
  api.getApps (err, apps) ->
    return handleError unless err == null
    console.log apps
```

With API key:

```coffee
api = new HerokuApi apiKey: 'my-api-key'
api.getApps (err, apps) ->
  return handleError(err) unless err == null
  console.log apps
```
