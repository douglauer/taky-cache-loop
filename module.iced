# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2
log = (x) -> try console.log x

_ = require 'lodash'

every = require 'every-time-mirror'
cache = require 'memory-cache'

module.exports = class CacheLoop

  fn: no
  key: 'key'
  prefix: 'cachel'
  interval: '1 min'

  constructor: (@obj) ->
    this[k] = v for k,v of obj

    @fn = @use if @use
    @fn = @refresh if @refresh
    @fn = @callback if @callback

    @interval = @every if @every

    if !@fn
      throw new Error 'You must provide a function value'

    if !@interval
      throw new Error 'You must provide an interval for cache refresh'

    # start cycle
    @_cycle()
    every @interval, => @_cycle()

  # force cycle refresh
  force: => @_cycle()

  read: ->
    if hit = cache.get (@prefix ? 'cachel') + ":#{@key}"
      hit
    else
      null

  val: -> @read()
  value: -> @read()

  _cycle: ->
    if @_type(@fn) is 'function'
      @fn (e,r) =>
        if !e
          cache.put ((@prefix ? 'cachel') + ":#{@key}"), r
        else

          # todo: use backup storage (redis,memcached)

  _type: (obj) ->
    return no if obj is 'undefined' or obj is null                                          
    Object::toString.call(obj).slice(8,-1).toLowerCase() 

###
c = new CacheLoop {
  fn: ((cb) ->
    cb null, new Date().getTime()
  )
  interval: '5 seconds'
}

every '1s', -> log c.read()

1406767835607
1406767835607
1406767835607
1406767835607
1406767835607
1406767840608
1406767840608
1406767840608
1406767840608
1406767840608
1406767845609
1406767845609
###

