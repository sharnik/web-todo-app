/** @jsx React.DOM */
var TaskBox = React.createClass({
  getInitialState: function() {
    return {tasks: [], projects: []};
  },

  loadStuffFromServer: function() {
    $.ajax({
      url: 'tasks.json',
      dataType: 'json',
      success: function(tasks) {
        this.setState({tasks: tasks});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error("tasks.json", status, err.toString());
      }.bind(this)
    });
    $.ajax({
      url: 'projects.json',
      dataType: 'json',
      success: function(projects) {
        this.setState({projects: projects});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error("projects.json", status, err.toString());
      }.bind(this)
    });
  },

  handleTaskSubmit: function(task) {
    $.ajax({
      url: this.props.tasks_url,
      dataType: 'json',
      type: 'POST',
      data: {task: task},
      success: function(tasks) {
        this.setState({tasks: tasks});
      }.bind(this)
    });
  },

  handleTaskComplete: function(task) {
    $.ajax({
      url: 'tasks/' + task.id + '/complete',
      dataType: 'json',
      type: 'POST',
      data: {},
      success: function(tasks) {
        this.setState({tasks: tasks});
      }.bind(this)
    });
  },

  handleTaskOpen: function(task) {
    $.ajax({
      url: 'tasks/' + task.id + '/open',
      dataType: 'json',
      type: 'POST',
      data: {},
      success: function(tasks) {
        this.setState({tasks: tasks});
      }.bind(this)
    });
  },

  handleProjectSubmit: function(project) {
    $.ajax({
      url: this.props.project_url,
      dataType: 'json',
      type: 'POST',
      data: {project: project},
      success: function(projects) {
        this.setState({projects: projects});
      }.bind(this)
    });
  },

  componentWillMount: function() {
    this.loadStuffFromServer();
    setInterval(this.loadStuffFromServer, this.props.pollInterval);
  },

  render: function() {
    return (
      <div>
        <div className="span8">
          <div className="task-list well">
            <h3>This is what you need to do:</h3>
            <TaskList data={this.state.tasks}
              onTaskComplete={this.handleTaskComplete}
              onTaskOpen={this.handleTaskOpen}
            />
            <TaskForm
              onTaskSubmit={this.handleTaskSubmit}
              projects={this.state.projects} />
          </div>
        </div>
        <div className="span3">
          <div className="well sidebar-nav project-list">
            <ProjectList data={this.state.projects} />
            <ProjectForm onProjectSubmit={this.handleProjectSubmit} />
          </div>
        </div>
      </div>
    );
  }
});

