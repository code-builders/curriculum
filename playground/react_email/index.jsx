var React = require("react");
var ReactDOM = require("react-dom");

var emails = [
  {subject: "Hello there!", body: "Lorem ipsum", from: "Tammy", to: "Bookis"},
  {subject: "Oh hi!", body: "Lorem ipsum", from: "Chris", to: "Bookis"},
  {subject: "Howdy", body: "Lorem ipsum", from: "LeShoya", to: "Bookis"},
  {subject: "Hey!", body: "Lorem ipsum", from: "Evelyn", to: "Bookis"},
  {subject: "Hello there!", body: "Lorem ipsum", from: "Danial", to: "Bookis"}
]

var Email = React.createClass({
  getInitialState: function() {
    return {emails: emails}
  },
  render: function() {
    return(
      <div>
        <EmailList emails={this.state.emails}/>
      </div>
    )
  }
});

var EmailList = React.createClass({
  render: function() {
    var emailDivs = [];

    for (var i = 0; i < this.props.emails.length; i++) {
      emailDivs.push(<EmailListItem key={i} email={this.props.emails[i]} />);
    }

    return(
      <div className="email-list">
        {emailDivs}
      </div>
    )
  }
});

var EmailListItem = React.createClass({
  render: function() {
    return(
      <div className="email-list-item">
        <h2>{this.props.email.subject}</h2>
        <p>{this.props.email.body.substring(0,40)}</p>
        <small>
          To: {this.props.email.to} From: {this.props.email.from}
        </small>
      </div>
    )
  }
});


ReactDOM.render(<Email />, document.getElementById("email"))
