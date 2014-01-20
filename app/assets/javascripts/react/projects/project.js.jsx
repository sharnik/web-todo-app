/** @jsx React.DOM */
var Project = React.createClass({
  handleProjectSwitch: function() {
    this.props.onProjectSwitch({id: this.props.id})
    return false;
  },

  render: function() {
    return (
      <li className="project">
        <a href='#' onClick={this.handleProjectSwitch}>{this.props.children} </a>
        <p>{this.props.description}</p>
      </li>
    );
  }
});

