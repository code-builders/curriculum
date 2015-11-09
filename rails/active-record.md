# Introduction to Active Record

Active Record is an  **Object Relational Mapping** technique. It is used to abstract and simplify the connection between your code and a database.


## Generating New AR Models

Active Record can set up the connections for us!

```bash
rails generate model student name:string cohort:string birthday:datetime
```

### Naming Conventions
|Model / Class (singular) |	Table / Schema (plural)| Filename (singular) |
|:------------:|:--------------:|:------:|
| Post	       | posts | post.rb|
|LineItem	|line_items| line_item.rb|
|Deer |	deers| deer.rb|
|Mouse |	mice| mouse.rb|
|Medium |	media| medium.rb|
|Person |	people| person.rb |

## Active Record Models

```ruby
class Student < ActiveRecord::Base

end
```

This will create a Student model, mapped to a students table at the database. By doing this you'll also have the ability to map the columns of each row in that table with the attributes of the instances of your model.

## Active Record as a DSL

Given a table in our database called "students" that has this structure:

| id | name  | cohort       | birthday   |
|:--:|:-----:|:-----------:|:----------:|
|  1 | Mary  | Fall 2015   | 11-13-1984 |
|  2 | Rosalita | Fall 2015   | 08-11-1979 |
|  3 | Raquel | Spring 2015 | 03-27-1990 |

```ruby
s = Student.new
s.name = "Libby"
puts s.name # "Libby"
```

ActiveRecord also adds class methods for reading records from the database

```ruby
# return a collection with all students
students = Student.all
# return the first student
student = Student.first
# return the first student named David
melissa = Student.find_by(name: 'Melissa')
```

It behaves like any other Ruby code, so we can chain methods together to create more complex queries.

<pre>
Student.where(cohort: "Fall 2015").order(birthday:  :desc)
</pre>

This finds all the records in our students table *where* cohort is "Fall 2015" and *orders* them by their birthdays, from youngest to newest (descending).

Using Multiple Primary Keys

```ruby
Student.find([1,2]) # This will return an array with two students
```

Array Conditions

```ruby
Student.where("name = ?", "Rosalita")
```

Hash Conditions
```ruby
Student.where(name: "Rosalita", cohort: "Fall 2015")
```

Not
```ruby
Student.where.not(name: "Rosalita")
```

Ordering
```ruby
Student.where(cohort: "Fall 2015").order(name: :asc)
```

There are many more querying methods within active record, see the [Rails guide](http://guides.rubyonrails.org/active_record_querying.html)
for more.

## What's it doing?

The Active Record DSL translates our Ruby code into SQL - similar to what you built in the FarMar Finder and Sinatra TaskList apps.

```ruby
Student.where(cohort: "Fall 2015").order('birthday DESC')
```

becomes

```sql
SELECT * FROM 'students' WHERE cohort = "Fall 2015" ORDER BY birthday DESC;
```

Active Record objects can be created from a hash, a block or have their attributes manually set after creation. **.new** returns a new object of that class, but doesn't save it to the database.

```ruby
Student.new(name: "Cassie", cohort: "Spring 2015")
```

```ruby
student = Student.new
student.name = "Cassie"
student.cohort = "Spring 2015"
```

Meanwhile, **.create** will return the object *and* save it to the database.

```ruby
Student.create(name: "Cassie", cohort: "Spring 2015")
```

Learn more about ActiveRecord from the [official rails guides](http://guides.rubyonrails.org/active_record_basics.html)


## What Did We Learn?
+ Active Record is an ORM, and provides a DSL for building queries
+ We touched briefly on how to create an Active Record model and migration
+ Some basic CRUD queries using Active Record


## Other Resources
http://guides.rubyonrails.org/active_record_basics.html  
http://guides.rubyonrails.org/migrations.html  
http://guides.rubyonrails.org/active_record_querying.html  
