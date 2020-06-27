require "thor"
require 'thor/hollaback'
require 'fileutils'
require 'colorize'
require_relative 'lib/db'
require_relative 'lib/scraper'

class DBCommand < Thor

  desc "create", "create a new SQLite3 database file for raw values"
  def create
    puts ' Connecting to database '.
      colorize(color: :white, background: :blue)
    DB::connection
  end

  desc "migrate", "migrate the SQLite3 database file"
  def migrate
    puts ' Migrating database file '.
      colorize(color: :white, background: :blue)
    system("sequel -m ./db/migrations sqlite://#{DB::filename}")
  end

  desc "delete", "delete the SQLite3 database file"
  def delete
    puts ' Deleting database file '.
      colorize(color: :white, background: :blue)
    FileUtils.rm 'db/values.sqlite3'
  end

end

class ScraperCommand < Thor

  option :before
  option :after
  desc "fdoh", "scrape from the Florida Department of Health"
  long_desc <<-LONGDESC
      Scrapes data from PDF updates from the Florida Department of Health.

      With --before option, processes all reports chronologically backwards and
      skips any report after that date.
      Example date format: 2020-06-27

      With --after option, processes all reports chronologically backwards until
      processing all reports issued on or before that date.
      Example date format: 2020-06-27

      Without --before or --after, processes only the current report.
    LONGDESC
  def fdoh
    Scraper::FDOH.new(options).scrape
  end

end

class WorkerCommand < Thor

  desc "console", "start a REPL console with DB model classes included"
  def console
    DB::check
    require 'irb'
    require 'irb/completion'
    ARGV.clear

    IRB.start
  end

  desc "db SUBCOMMAND ...ARGS", "manage database"
  subcommand "db", DBCommand

  desc "scrape SUBCOMMAND ...ARGS", "scrape external data sources"
  subcommand "scrape", ScraperCommand

end

WorkerCommand.start(ARGV)
