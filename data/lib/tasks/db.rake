namespace 'db' do

  desc "Create a new database"
  task :create do
    # # Just making a connection to a SQLite database creates it.
    DB::connection
  end

  desc "Migrate database schema to the current structure"
  task :migrate do
    system("sequel -m ./db/migrations sqlite://#{DB::filename}")
  end

end
