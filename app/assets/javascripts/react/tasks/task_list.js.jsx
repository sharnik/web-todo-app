/** @jsx React.DOM */
var TaskList = React.createClass({
  render: function() {
    var completeHandler = this.props.onTaskComplete;
    var openHandler = this.props.onTaskOpen;
    var taskNodes = this.props.data.map(function (task) {
      return <Task
        completed_at={task.completed_at}
        id={task.id}
        project={task.project}
        onTaskComplete={completeHandler}
        onTaskOpen={openHandler}
        >
          {task.content}
        </Task>;
    });
    return (
      <div>
        {taskNodes}
      </div>
    );
  }
});

