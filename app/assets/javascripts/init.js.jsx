/** @jsx React.DOM */
var data = [
  {content: "Eat", id: 1, completed_at: '2013-01-10 11:30'},
  {content: "Sleep", id: 2, completed_at: '2013-01-10 13:45'},
  {content: "Wag the tail", id: 3, completed_at: null}
];

React.renderComponent(
  <TaskBox data={data} />,
  document.getElementById('task-content')
);
