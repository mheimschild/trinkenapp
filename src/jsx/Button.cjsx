React = require('react')

Button = React.createClass

  render: ->
    <button className="btn btn-default" onClick={(-> @props.add(@props.value, @props.name)).bind(this)}>
      <i className="glyphicon glyphicon-plus"></i>
      &nbsp;{@props.name}
    </button>

module.exports = Button