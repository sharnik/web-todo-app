/** @jsx React.DOM */
var ProjectForm = React.createClass({

  handleSubmit: function() {
    var name = this.refs.name.getDOMNode().value.trim();
    var description = this.refs.description.getDOMNode().value.trim();
    if (!name) {
      return false;
    }
    this.props.onProjectSubmit({name: name, description: description});
    this.refs.name.getDOMNode().value = '';
    this.refs.description.getDOMNode().value = '';
    return false;
  },

  render: function() {
    return (
      <div className='project-form'>
        <form className="projectForm" onSubmit={this.handleSubmit} >
          <input type="text" placeholder="Project name" ref='name' />
          <input type="text" placeholder="Project description" ref='description' />
          <input className='btn btn-success btn-block' type="submit" value="Create Project" />
        </form>
      </div>
    );
  }
});

