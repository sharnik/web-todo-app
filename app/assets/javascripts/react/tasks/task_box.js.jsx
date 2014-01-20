/** @jsx React.DOM */
var TaskBox = React.createClass({
  getInitialState: function() {
    return {data: []};
  },

  loadTasksFromServer: function() {
    $.ajax({
      url: 'tasks.json',
      dataType: 'json',
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error("tasks.json", status, err.toString());
      }.bind(this)
    });
  },

  componentWillMount: function() {
    this.loadTasksFromServer();
    setInterval(this.loadTasksFromServer, this.props.pollInterval);
  },

  render: function() {
    return (
      <div className="task-list well">
        <h3>This is what you need to do:</h3>
        <TaskList data={this.state.data}/>
        <TaskForm />
      </div>
    );
  }
});

