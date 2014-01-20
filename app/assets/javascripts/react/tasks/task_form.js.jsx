/** @jsx React.DOM */
var TaskForm = React.createClass({

  handleSubmit: function() {
    var content = this.refs.content.getDOMNode().value.trim();
    var project_id = this.refs.project_id.getDOMNode().value.trim();
    if (!content || !project_id) {
      return false;
    }
    this.props.onTaskSubmit({content: content, project_id: project_id});
    this.refs.content.getDOMNode().value = '';
    this.refs.project_id.getDOMNode().value = '';
    return false;
  },

  render: function() {
    var projectSelectNodes = this.props.projects.map(function (project) {
      return <option value={project.id}>{project.name}</option>
    });

    return (
      <div className='task-form'>
        <form className="taskForm" onSubmit={this.handleSubmit} >
          <input type="text" placeholder="Task itself" ref='content' />
          <select className="form-control" ref='project_id' >{projectSelectNodes}</select>
          <input className='btn btn-success btn-block' type="submit" value="Create Task" />
        </form>
      </div>
    );
  }
});
