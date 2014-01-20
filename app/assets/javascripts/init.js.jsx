/** @jsx React.DOM */
React.renderComponent(
  <TaskBox tasks_url='tasks.json' project_url='projects.json' pollInterval={2000} />,
  document.getElementById('content')
);
