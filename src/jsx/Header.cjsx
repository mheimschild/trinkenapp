React = require('react')

Header = React.createClass

  _clear: ->
    @props.dispatcher.dispatch
      method: "clear"

  render: ->
    <div className="row">
      <div className="col-md-12">
        <button className="btn btn-lg btn-success btn-block" onClick={@_clear}>Neuer Tag</button>
      </div>
    </div>

module.exports = Header