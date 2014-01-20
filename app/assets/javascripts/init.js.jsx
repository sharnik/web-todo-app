/** @jsx React.DOM */
React.renderComponent(
  <TaskBox tasks_url='tasks.json' project_url='projects.json' pollInterval={2500} />,
  document.getElementById('content')
);
