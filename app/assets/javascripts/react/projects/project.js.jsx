/** @jsx React.DOM */
var Project = React.createClass({
  render: function() {
    return (
      <li className="project">
        <a href='#'>{this.props.children}</a>
      </li>
    );
  }
});

