# SQL (w/ Postgresql)

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

```sh

```
```sql
COPY markets(name, address, city, county, state, zip) FROM 'markets.csv'  WITH NULL AS '' DELIMITER ',';
```

```sql
SELECT count(*) FROM markets;
```
