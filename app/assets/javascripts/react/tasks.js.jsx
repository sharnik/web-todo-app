/** @jsx React.DOM */
var HelloMessage = React.createClass({
  render: function() {
    return <div>{'Damn ' + this.props.name}</div>;
  }
});
