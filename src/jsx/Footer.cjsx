React = require('react')
Button = require('coffee-jsx!./Button.cjsx')

Footer = React.createClass

  _add: (key, name, volume) ->
    @props.dispatcher.dispatch
      method: "add"
      key: key
      name: name
      volume: volume

  render: ->
    <div className="row">
      <div className="col-md-12">
        <div className="text-center">
          <div className="btn-group btn-group-lg">
            <Button value="saft" name="Saft" volume=250 add={@_add}/>
            <Button value="haeferl" name="Häferl" volume=200 add={@_add}/>
            <Button value="200ml" name="200ml" volume=200 add={@_add}/>
            <Button value="250ml" name="250ml" volume=250 add={@_add}/>
          </div>
        </div>
      </div>
    </div>

module.exports = Footer