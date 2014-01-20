/** @jsx React.DOM */
var TaskList = React.createClass({
  getOpenTasks: function() {
    return this.props.data.filter(function(el) {
      return el.completed_at == null
    });
  },

  getClosedTasks: function() {
    return this.props.data.filter(function(el) {
      return !(el.completed_at == null)
    });
  },

  mapToTask: function(array) {
    var completeHandler = this.props.onTaskComplete;
    var openHandler = this.props.onTaskOpen;

    return array.map(function (task) {
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
  },

  render: function() {
    var openTaskNodes = this.mapToTask(this.getOpenTasks());
    var closedTaskNodes = this.mapToTask(this.getClosedTasks());
    return (
      <div>
        <div className='open-tasks'>{openTaskNodes}</div>
        <div className='closed-tasks'>{closedTaskNodes}</div>
      </div>
    );
  }
});

