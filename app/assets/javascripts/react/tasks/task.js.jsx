/** @jsx React.DOM */
var Task = React.createClass({
  render: function() {
    return (
      <p className="task">
        {this.props.children}
      </p>
    );
  }
});
