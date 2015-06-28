EventEmitter = require("events").EventEmitter

class Store extends EventEmitter
  constructor: (@dispatcher) ->
    @volume = 0
    @list = {}

    dispatcherCb = (payload) ->
      switch payload.method
        when "add"
          @list[payload.key] = @list[payload.key] || { count: 0, name: payload.name, volume: payload.volume }
          @list[payload.key].count += 1
          @volume += payload.volume

        when "reduce"
          key = payload.key
          if @list[key] && @list[key].count > 0
            @list[key].count -= 1
            @volume -= payload.volume

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

  getTotal: ->
    @volume

module.exports = Store