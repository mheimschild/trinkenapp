React = require('react')

List = React.createClass

  _reduce: (key) ->
    @props.dispatcher.dispatch
      method: "reduce"
      key: key

  render: ->
    list = Object.keys(@props.data).map ((key) ->
      (<li className="list-group-item" onClick={(-> @_reduce(key)).bind(this)}>{@props.data[key].count} x {@props.data[key].name}</li>)
    ).bind(this)
    
    <ul className="list-group">
    {list}
    </ul>

module.exports = List