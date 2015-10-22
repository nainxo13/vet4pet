var Appointments = React.createClass({
  getInitialState: function() {
    return {
      appointments: this.props.data
    };
  },
  getDefaultProps: function() {
    return {
      appointments: []
    };
  },
  render: function() {
      var todos = [];
      var trNodes = this.props.data.map(function (appointment) {
        var row = <tr key="{appointment.id}">
          <td>{appointment.date}</td> <td>{appointment.petname}</td> <td>{appointment.owner}</td> <td>{appointment.reason}</td> <td>{appointment.docname}</td>
          <td>Delete</td><td>Edit</td>
          </tr>
        ;
        todos.push(row);
      });
      console.log(todos);
      var appoNodes = <table className="myTable"><tr><td> Scheduled date </td> <td>Pet</td> <td>Owner</td> <td>Reason</td> <td>Doctor</td><td>Delete</td><td>Edit</td></tr>
          { todos }
        </table>
      ;
    return (
      <div className="appoList">
        {appoNodes}
      </div>
    );
  }
});

