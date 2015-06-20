(function() {
  var React = require("react");

  var App = require("coffee-jsx!../jsx/App.cjsx");

  React.render(React.createElement(App), document.getElementById('main'));
})();