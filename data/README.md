# COVID-19 Data Warehouse

## Schema

A simple star schema, stored in a SQLite3 file.

## Setup

### Set up a Ruby environment

    bundle install

### Set up a SQLite3 database file with the right structure

Create the database file:

    rake db:create

You should now have a database that you should be able to inspect with:

    sqlite3 db/values.sqlite3

Set up the database schema (structure):

    rake db:migrate

Now you should be able to see database tables:

    $ sqlite3 db/values.sqlite3
    SQLite version 3.28.0 2019-04-15 14:49:49
    Enter ".help" for usage hints.
    sqlite> .tables
    dim_dates          dim_series_groups  fact_values
    dim_series         dim_sources        schema_info
    sqlite>

### Get a console on the data

This Rake task will open a console, with the model classes loaded:

    rake console:irb
