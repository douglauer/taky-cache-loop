# taky-cache-loop

# install

using [npm](https://npmjs.org)

```
npm i taky-cache-loop --save
```

# example

``` coffeescript
CacheLoop = require 'taky-cache-loop'

cache = new CacheLoop {
  key: '5sdate'
  fn: ((cb) ->
    cb null, new Date().getTime()
  )
  interval: '5 seconds'
}

every '1s', -> 
  log cache.read()

###
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
```


