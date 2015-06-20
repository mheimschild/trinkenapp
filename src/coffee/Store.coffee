EventEmitter = require("events").EventEmitter

class Store extends EventEmitter
  constructor: (@dispatcher) ->
    @list = {}

    dispatcherCb = (payload) ->
      switch payload.method
        when "add"
          @list[payload.key] = @list[payload.key] || { count: 0, name: payload.name }
          @list[payload.key].count += 1
        when "reduce"
          key = payload.key
          if @list[key] && @list[key].count > 0
            @list[key].count -= 1

            if @list[key].count == 0
              delete @list[key]
        when "clear"
          @list = {}
      
      this.emit "change"

    @dispatcher.register dispatcherCb.bind(this)

  addListener: (listener) ->
    @on "change", (->
      listener()
    )

  getList: ->
    @list

module.exports = Store