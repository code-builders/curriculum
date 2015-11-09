# SQL (w/ Postgresql)

SQL (Structred Query Language) is a programming language created to manage data within databases. We won't go into extreme detail in the language and usage of SQL (we will rely on Rails to build the queries for us). Instead we will look at some of the basic usage and how it works to get an idea of what SQL is good for. This walkthrough should show the tip of the iceberg.

Follow along with the following code. Start by typing `psql` to enter a postgresql command line.

```sql
CREATE TABLE markets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(255),
  county VARCHAR(255),
  state VARCHAR(255),
  zip VARCHAR(10)
);
```

```sql
INSERT INTO markets(name, address, city, county, state, zip) VALUES('Cap Hill', '123 Fake St', 'Seattle', 'King', 'WA', 98102);
INSERT INTO markets(name, address, city, county, state, zip) VALUES('University District', 'The Ave', 'Seattle', 'King', 'WA', 98105);
INSERT INTO markets(name, address, city, county, state, zip) VALUES('Downtown Madison', 'Main st', 'Madison', 'Dane', 'WI', 53711);
INSERT INTO markets(name, address, city, county, state, zip) VALUES('Mission District', 'Bartlett st', 'San Francisco','San Francisco', 'CA', 94101);
```

```sql
SELECT * FROM markets WHERE state = 'WA';
SELECT * FROM markets WHERE id > 2;
SELECT * FROM markets WHERE zip > '60000';
SELECT * FROM markets WHERE state > 'CA';
SELECT * FROM markets WHERE address ILIKE '%st%';
```

```sql
UPDATE markets SET address = 'Broadway' WHERE id = 1;
```

```sql
DELETE FROM markets WHERE id = 3;
```

Use `\q` to exit the psql command line.

```sh
curl -o /usr/local/var/postgres/markets.csv https://raw.githubusercontent.com/code-builders/curriculum/master/tools/resources/markets.csv
psql
```
```sql
COPY markets(name, address, city, county, state, zip) FROM 'markets.csv'  WITH NULL AS '' DELIMITER ',';
```

| Sign     | Meaning     |
| :------------- | :------------- |
| >       | Greater than       |
| <       | Less than       |
| <=       | Less than or equal to       |
| >=       | Greater than or equal to       |
| =       | Equal to       |
| <> or !=       | Not equal to       |
| LIKE       | Similar to (using "%" as wildcards)       |
| ILIKE       | Case-insensitive similar to (using "%" as wildcards)       |

```sql
SELECT count(*) FROM markets;
SELECT * FROM markets WHERE city = 'Seattle';
SELECT * FROM markets WHERE name ILIKE '%lake%';
SELECT * FROM markets WHERE state = 'California';
SELECT * FROM markets WHERE state = 'California' AND county = 'Orange';
SELECT * FROM markets WHERE state = 'California' ORDER BY city;
SELECT * FROM markets WHERE state = 'California' ORDER BY city LIMIT 1;
```

```sql
DROP TABLE markets;
```
