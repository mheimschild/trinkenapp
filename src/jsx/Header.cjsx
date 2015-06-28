React = require('react')

Header = React.createClass

  _getAlertClass: ->
    return "alert alert-danger" if @props.total < 500
    return "alert alert-warning" if @props.total < 1000
    "alert alert-success"

  _clear: ->
    @props.dispatcher.dispatch
      method: "clear"

  render: ->
    <div className="row">
      <div className="col-md-12">
        <button className="btn btn-lg btn-success btn-block" onClick={@_clear}>Neuer Tag</button>
      </div>
      <div className="col-md-12">
        <div className={@_getAlertClass()}>
          Total: {@props.total} ml
        </div>
      </div>
    </div>

module.exports = Header