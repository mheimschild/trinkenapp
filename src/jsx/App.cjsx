React = require('react')
Header = require "coffee-jsx!./Header.cjsx"
List = require "coffee-jsx!./List.cjsx"
Footer = require "coffee-jsx!./Footer.cjsx"
Store = require "coffee!../coffee/Store.coffee"
Dispatcher = require("flux").Dispatcher

App = React.createClass

  _onchange: ->
    @setState(
      list: @store.getList()
    )

  getInitialState: ->
    {list: []}

  componentWillMount: ->
    @dispatcher = new Dispatcher()
    @store = new Store(@dispatcher)

    @store.addListener @_onchange

  render: ->
    <div className="container-fluid">
      <Header dispatcher={@dispatcher}/>
      <List data={@state.list} dispatcher={@dispatcher}/>
      <Footer dispatcher={@dispatcher}/>
    </div>

module.exports = App