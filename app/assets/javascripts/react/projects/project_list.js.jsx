/** @jsx React.DOM */
var ProjectList = React.createClass({

  render: function() {
    var projectSwitchHandler = this.props.onProjectSwitch

    var projectNodes = this.props.data.map(function (project) {
      return <Project
        description={project.description}
        id={project.id}
        onProjectSwitch={projectSwitchHandler}
      >{project.name}</Project>;
    });

    return (
      <ul className="nav nav-list">
        <li className="nav-header">Projects</li>
        {projectNodes}
      </ul>
    );
  }
});
