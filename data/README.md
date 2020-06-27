# COVID-19 Data Warehouse

The scraper stores its bits of raw data in a data warehouse, tagged by date and data source.

The bits of raw data are structured in a simple star schema, stored in a SQLite3 file.

You can extract the data in CSV form through Worker commands.  Worker is a CLI utility for running database management tasks, PDF scraping runs, and reporting.  

Operate Worker by running the Ruby script ```worker.rb```:

    ruby worker.rb

example:

    $ ruby worker.rb
    Commands:
      worker.rb console                # start a REPL console with DB model classes included
      worker.rb db SUBCOMMAND ...ARGS  # manage database
      worker.rb help [COMMAND]         # Describe available commands or one specific command

    $


## Setup

### Set up a Ruby environment

    bundle install

### Set up a SQLite3 database file with the right structure

Create the database file:

    ruby worker.rb db create

You should now have a database that you should be able to inspect with:

    sqlite3 db/values.sqlite3

Set up the database schema (structure):

    ruby worker.rb db migrate

Now you should be able to see database tables:

    $ sqlite3 db/values.sqlite3
    SQLite version 3.28.0 2019-04-15 14:49:49
    Enter ".help" for usage hints.
    sqlite> .tables
    dim_dates          dim_series_groups  fact_values
    dim_series         dim_sources        schema_info
    sqlite>

## Get a console on the data

This command will open a console, with the model classes loaded:

    ruby worker.rb console

Example:

    $ ruby worker.rb console
    2.6.5 :001 > DB::FactValue.count
    => 20273
    2.6.5 :002 > DB::FactValue.last
    => {:dim_source=>"Florida Department of Health", :dim_series_group=>"counties", :dim_series=>"Total", :dim_date=>"2020-06-27", :dim_metric=>"total tested", :raw=>"1,830,791"}

## Scrape to get more data

Get the latest FDOH report, without caching:

    ruby worker.rb scrape fdoh

Get all historic reports, and process each one if it's on or after the after date:

    ruby workerl.rb scrape fdoh --after 2020-06-25

Get all historic reports, and process each one if it's on or before the before date:

    ruby workerl.rb scrape fdoh --before 2020-06-25
