namespace :console do
  desc 'start irb console to use ORM models'
  task :irb do
    require 'irb'
    require 'irb/completion'
    ARGV.clear
    IRB.start
  end
end
