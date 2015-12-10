## User Password

Create a `User` class (plain ruby, not rails) with the following:

- `.new` should accept three values as separate arguments **OR** as a hash of three key/values
  - `username`
  - `password`
  - `password_confirmation`
- Create an instance method called `.valid?`, which should compare the `password` and `password_confirmation` to ensure they are identical. The method should return `true` or `false`
- Create an instance method called `.authenticate(pwd)`,  which takes one argument which is an attempted password, it should return `true` if it matches the original password given
