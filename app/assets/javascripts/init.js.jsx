/** @jsx React.DOM */
React.renderComponent(
  <TaskBox url='tasks.json' pollInterval={2500} />,
  document.getElementById('task-content')
);
