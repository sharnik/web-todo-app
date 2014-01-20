/** @jsx React.DOM */
var ProjectList = React.createClass({
  render: function() {
    var projectNodes = this.props.data.map(function (project) {
      return <Project>{project.name}</Project>;
    });
    return (
      <ul className="nav nav-list">
        <li className="nav-header">Projects</li>
        {projectNodes}
      </ul>
    );
  }
});
