# React 103

In this section we're going to add a events to our react components so that we can change the content based on user interaction. We're going to make a component to show the whole email and bind events to the sidebar, when clicked that specific email should show.

Let's start by making a new component:

```js
var EmailPreview = React.createClass({
  render: function() {
    var body;
    if (this.props.email) {
      body = <h1>{this.props.email.subject}</h1>
    } else {
      body = <h1>...</h1>
    }
    return(
      <div className="email-preview">
        {body}
      </div>
    )
  }
})
```

In this section we are using a conditional to determine if an email had been selected, if not we're not going to show anything, if so we're showing it's subject in a new div.

Next, lets add this component as a child to the `Email` component:

```js
var Email = React.createClass({
  getInitialState: function() {
    return {emails: emails, currentEmail: null}
  },
  render: function() {
    return(
      <div>
        <EmailList emails={this.state.emails}/>
        <EmailPreview email={this.state.currentEmail} />
      </div>
    )
  }
});
```

We've also added `currentEmail` to the initial state of the `Email` component, this will keep track of which email to display in the `EmailPreview` component. We'll default that value to null.

Next we need to add our click event.

Since the `Email` component is the parent of all of this, the click event will need to happen on this component, to update the state. We can define a function on this component which will change the `currentEmail`


```js
var Email = React.createClass({
  getInitialState: function() {
    return {emails: emails, currentEmail: null}
  },
  showEmail: function(email) {
    this.setState({currentEmail: email});
  },
  render: function() {
    return(
      <div>
        <EmailList handleClick={this.showEmail} emails={this.state.emails}/>
        <EmailPreview email={this.state.currentEmail} />
      </div>
    )
  }
});
```

To get this function to happen when we click an `EmailListItem` we need to pass the function down the line through props, we've put it in `EmailList` and we'll pass it again to `EmailListItem`:


```js
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
```
