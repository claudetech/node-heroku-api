lodash = require 'lodash'

lodash.mixin
  delete: (obj, key) ->
    ret = obj[key]
    delete obj[key]
    ret

module.exports = lodash
