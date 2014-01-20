/** @jsx React.DOM */
var Task = React.createClass({
  handleComplete: function() {
    this.props.onTaskComplete({id: this.props.id});
    return false;
  },

  handleOpen: function() {
    this.props.onTaskOpen({id: this.props.id});
    return false;
  },

  render: function() {
    if(this.props.completed_at) {
      var input = <input type="checkbox" value="" onClick={this.handleOpen} checked='checked' />
    } else {
      var input = <input type="checkbox" value="" onClick={this.handleComplete} />
    }
    return (
      <div className="checkbox">
        <label>
          {input}
          {this.props.children}
          ({this.props.project})
        </label>
      </div>
    );
  }
});
