/** @jsx React.DOM */
var TaskList = React.createClass({
  render: function() {
    var taskNodes = this.props.data.map(function (task) {
      return <Task completed_at={task.completed_at} id={task.id}>{task.content}</Task>;
    });
    return (
      <div>
        {taskNodes}
      </div>
    );
  }
});

