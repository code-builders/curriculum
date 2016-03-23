# React 104

In this lecture we're going to add a form to create an email as well as link to delete an email. We'll start by making a component to show the form:

```js
var EmailForm = React.createClass({
  getInitialState: function() {
    return {to: null, from: "Bookis", subject: null, body: null};
  },
  render: function() {
    return(
      <form>
        <div>
          <label>To: </label><br/>
          <input type="text" name="to" />
        </div>
        <div>
          <label>Subject: </label><br/>
          <input type="text" name="subject" />
        </div>
        <div>
          <label>Body: </label><br/>
          <textarea type="text" name="body"/>
        </div>
        <input type="submit" value="Submit" />
      </form>
    );
  }
});
```

Not too much different here, we have a component which renders a form. It has it's own initial state, no other components need to change these values. Next we'll add some logic to conditionally show this form in the main section of the page. We'll start by adding a state to the `Email` component which will remember if the form is showing or not, and we'll add a conditional in the render.


```js
var Email = React.createClass({
  getInitialState: function() {
    return {emails: emails, currentEmail: null, showForm: false}
  },
  // ...
  render: function() {
  var main;
  if (this.state.showForm) {
    main = <EmailForm />
  } else {
    main = <EmailPreview email={this.state.currentEmail}/>
  }
  return(
    <div>
      <EmailList handleClick={this.setCurrentEmail} emails={this.state.emails}/>
      {main}
    </div>
  )
}
```

Next we'll add a simple function to the `Email` component which shows the form:

```js
var Email = React.createClass({
  getInitialState: function() {
    return {emails: emails, currentEmail: null, showForm: false}
  },
  showForm: function() {
    this.setState({showForm: true})
  },
  // ...

```

We can pass this function down to any other component which should have the ability to show the form, we may want to put a button in the `EmailPreview` component for now, so we'll pass the function down through `props` and add a button:

```js
var Email = React.createClass({
  getInitialState: function() {
    return {emails: emails, currentEmail: null, showForm: false}
  },
  setCurrentEmail: function(email) {
    this.setState({currentEmail: email, showForm: false});
  },
  showForm: function() {
    this.setState({showForm: true})
  },
  render: function() {
    var main;
    if (this.state.showForm) {
      main = <EmailForm />
    } else {
      main = <EmailPreview showForm={this.showForm} email={this.state.currentEmail}/>
    }
    return(
      <div>
        <EmailList handleClick={this.setCurrentEmail} emails={this.state.emails}/>
        {main}
      </div>
    )
  }
});

// ...

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
        <button onClick={this.props.showForm}>+</button>
      </div>
    )
  }
});
```

Now we have a simple button which can show the form, here we've also made it so that when we set the current email it hides the form.

Next let's actually hook up the form to make the changes to the state and a function to add the email to our list of emails:


```js
var EmailForm = React.createClass({
  getInitialState: function() {
    return {to: null, from: "Bookis", subject: null, body: null};
  },
  setInput: function(e) {
    var newState = {};
    newState[e.target.name] = e.target.value;
    this.setState(newState);
  },
  render: function() {
    return(
      <form>
        <div>
          <label>To: </label><br/>
          <input type="text" onChange={this.setInput} name="to" />
        </div>
        <div>
          <label>Subject: </label><br/>
          <input type="text" onChange={this.setInput} name="subject" />
        </div>
        <div>
          <label>Body: </label><br/>
          <textarea type="text" onChange={this.setInput} name="body"/>
        </div>
        <input type="submit" value="Submit" />
      </form>
    );
  }
});
```

We've added the `onChange` attribute to all of the inputs which runs the `setInput` function, this will change the state of the current object, which won't change any other component at this point. Next we need to add a `onSubmit` event to the form which should send the data up to the `Email` component to update the `emails` array.


```js
var Email = React.createClass({
  getInitialState: function() {
    return {emails: emails, currentEmail: null, showForm: false}
  },
  setCurrentEmail: function(email) {
    this.setState({currentEmail: email, showForm: false});
  },
  createEmail: function(email) {
    var newEmails = this.state.emails;
    newEmails.push(email)
    this.setState({emails: newEmails, currentEmail: email, showForm: false})
  },
  // ...
  render: function() {
  var main;
  if (this.state.showForm) {
    main = <EmailForm createEmail={this.createEmail}/>
  } else {
    main = <EmailPreview showForm={this.showForm} email={this.state.currentEmail}/>
  }
  return(
    <div>
      <EmailList handleClick={this.setCurrentEmail} emails={this.state.emails}/>
      {main}
    </div>
  )
}

var EmailForm = React.createClass({
  getInitialState: function() {
    return {to: null, from: "Bookis", subject: null, body: null};
  },
  setInput: function(e) {
    var newState = {};
    newState[e.target.name] = e.target.value;
    this.setState(newState);
  },
  createEmail: function(e) {
    e.preventDefault();
    this.props.createEmail(this.state)
  },
  render: function() {
    return(
      <form onSubmit={this.createEmail}>
        <div>
          <label>To: </label><br/>
          <input type="text" onChange={this.setInput} name="to" />
        </div>
        <div>
          <label>Subject: </label><br/>
          <input type="text" onChange={this.setInput} name="subject" />
        </div>
        <div>
          <label>Body: </label><br/>
          <textarea type="text" onChange={this.setInput} name="body"/>
        </div>
        <input type="submit" value="Submit" />
      </form>
    );
  }
});
```
