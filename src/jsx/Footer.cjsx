React = require('react')
Button = require('coffee-jsx!./Button.cjsx')

Footer = React.createClass

  _add: (key, name) ->
    @props.dispatcher.dispatch
      method: "add"
      key: key
      name: name

  render: ->
    <div className="row">
      <div className="col-md-12">
        <div className="text-center">
          <div className="btn-group btn-group-lg">
            <Button value="saft" name="Saft" add={@_add}/>
            <Button value="haeferl" name="Häferl" add={@_add}/>
            <Button value="200ml" name="200ml" add={@_add}/>
          </div>
        </div>
      </div>
    </div>

module.exports = Footer