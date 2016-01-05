# Bank Account

Create a `Bank` class which allows deposits, withdrawals, and transfers from accounts. An instance will have the following attributes (accounts) `checking`, `savings`, & `credit`. `checking` and `savings` should start at `1` while `credit` will start at `100000` (all amounts should be in cents)

And it should have the following methods and behaviour:

- `.balances()` - Gives a hash, each account as a key and the accounts balance as the value to that key.
- `.balance(account)` - Shows the current balance of the given account.
- `.withdraw(amount, account)` - Removes the input `amount` from the specified `account`.
- `.deposit(amount, account)` - Adds the input `amount` to the specified `account`.
- `.transfer(amount, from, to)` - Removes the input `amount` from the `from` account and adds it to the `to` account.
- In the `.withdraw` or `.transfer` methods, if the account will become negative an error should be raised and the accounts should not be changed.
- `.swipe(amount)` - Same as `.withdraw` but defaults to `credit` account.
- `.make_payment(amount) - Same as `.deposit` but defaults to `credit` account.
