var React = require("react");
var ReactDOM = require("react-dom");

var emails = [
  {subject: "Hello there!", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", from: "Tammy", to: "Bookis"},
  {subject: "Oh hi!", body: "Lorem ipsum", from: "Chris", to: "Bookis"},
  {subject: "Howdy", body: "Lorem ipsum", from: "LeShoya", to: "Bookis"},
  {subject: "Hey!", body: "Lorem ipsum", from: "Evelyn", to: "Bookis"},
  {subject: "Hello there!", body: "Lorem ipsum", from: "Danial", to: "Bookis"}
]

var Email = React.createClass({
  setCurrentEmail: function(email) {
    this.setState({currentEmail: email});
  },
  getInitialState: function() {
    return {emails: emails, currentEmail: null}
  },
  render: function() {
    return(
      <div>
        <EmailList handleClick={this.setCurrentEmail} emails={this.state.emails}/>
        <EmailPreview email={this.state.currentEmail}/>
      </div>
    )
  }
});

var EmailPreview = React.createClass({
  render: function() {
    var body;
    if (this.props.email) {
      body = (
        <div>
          <h1>{this.props.email.subject}</h1>
          <p>{this.props.email.body}</p>
          <small>
            From: {this.props.email.from} To: {this.props.email.to}
          </small>
        </div>
      )
    } else {
      body = <h1>...</h1>
    }
    return(
      <div className='email-preview'>
        {body}
      </div>
    )
  }
});

var EmailList = React.createClass({
  render: function() {
    var emailDivs = [];

    for (var i = 0; i < this.props.emails.length; i++) {
      emailDivs.push(<EmailListItem handleClick={this.props.handleClick} key={i} email={this.props.emails[i]} />);
    }

    return(
      <div className="email-list">
        {emailDivs}
      </div>
    )
  }
});

var EmailListItem = React.createClass({
  showEmail: function() {
    this.props.handleClick(this.props.email);
  },
  render: function() {
    return(
      <div onClick={this.showEmail} className="email-list-item">
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
