/** @jsx React.DOM */
var Task = React.createClass({
  render: function() {
    return (
      <div className="checkbox">
        <label>
          <input type="checkbox" value="" checked={this.props.completed_at} />
          {this.props.children}
          ({this.props.project})
        </label>
      </div>
    );
  }
});
