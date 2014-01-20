/** @jsx React.DOM */
var TaskBox = React.createClass({
  render: function() {
    return (
      <div className="task-list well">
        <h3>This is what you need to do:</h3>
        <TaskList data={this.props.data}/>
        <TaskForm />
      </div>
    );
  }
});

