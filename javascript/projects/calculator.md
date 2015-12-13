# Js calculator

Create a web based calculator which has the following:

- Three HTML input fields:
  - A number field (the first number in a calculation i.e. `x`)
  - An operator `select` menu with standard calculator function as `option` elements (`+-*/`).
  - A number field (the second number in a calculation i.e. `y`)
- A submit button
- When the submit button is clicked the calculation should be carried out in javascript
  - A `div` with the `id="answer"`, where the calculation is displayed.
  - The contents of the `answer` `div` is replaced each time a calculation is made
  - The `x` number field is changed to the calculated answer to allow for a duplicate calculation on the current result.
- A `CE` button which clears all of the text fields and resets the answer to `0`
  - When clicked focus is returned to the `x` field. (Lookup `.focus`)


### Extended Requirements

- Abstract the logic for the calculation into it's own function
- Add Square `<option>`
- Add Square Root `<option>`
- Add a `±` button which inverts the current answer as well as the value in the `x` field
- When an invalid number (such as a letter) is given, show an error message (styled in red) that their operation isn't possible.
- Create a number pad or integer buttons, operators, and a `.` button to allow the user to click buttons to enter their numbers.
- Use the `onkeyup` event listener to allow the user to put in the numbers and operator without needing to change between input fields (i.e. the `"x"` key selects the value `x` from the operators)
