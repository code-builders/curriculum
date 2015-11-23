## Stat Tracker

Build a single-serving (only one user, you!) rails application to help track  some metric that is important to you.

- Pick a theme
- Create a Stat Model (you can call it whatever you like, i.e. SleepStat, MoodLog, FocusMetric)
  - Stat column of type `integer` or `float` (again, called whatever you would like, i.e. `hours`, `batting_average`)
  - Any additional columns you would like to track.
  - Use the auto-generated `created_at` column to keep track of when the stat was recorded
- Create a Stat Controller with the following methods:
  - `index`
    - Renders a view which lists all of the stats in a `<table>`
    - Includes a form to add a new stat
    - A button for each stat in the table to delete that stat (for mistakes)
  - `add_stat`
    - Adds a Stat to the database
    - redirects to index if successful
    - renders `index` with error messages if fails
  - `remove_stat`
    - Url needs an id of a stat
    - The stat with that id is removed from the database
    - Redirects to the `index` page
- Design the page to match the themes you've chosen

Keep this application as simple as possible. Spend time studying each piece and identifying the HTTP cycle through rails which happens with any given page load or form submission. Try some alternate study methods to get the concepts down, like drawing a diagram of your application or writing out in a english what is happening inside rails.

### Extended Requirements

- Hide the form on `index`, use a toggle button to show the form when clicked.
- Add a method to the Stat model to return an average overall value for the stat, integrate this number into the design.
- Style each stat entry on the `index` page with a custom style (i.e. three different classes `high`, `medium`, `low` conditionally added based on the stat)
- Add an addition form which allows you to select specific time periods. The average number shown above should show the average for the selected period.
