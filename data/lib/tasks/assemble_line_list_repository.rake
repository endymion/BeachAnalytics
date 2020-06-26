namespace 'git' do

  folder = '/Users/work/projects/line-lists--florida-department-of-health'

  desc "Assemble git repository for line list of deaths from FDOH"
  task :build do

    Dir.chdir(folder)
    folders = Dir.glob('*').select {|f| File.directory? f}.sort

    command = 'rm -rf .git; git init .'
    puts "Command: #{command}"
    puts system(command)

    folders.each do |date|
      puts "Folder: #{date}"

      command = "cp #{File.join(folder, date, 'line-list-of-deaths.txt')} ./line-list-of-deaths.txt"
      puts "Command: #{command}"
      puts system(command)

      command = "cp #{File.join(folder, date, 'line-list-of-cases.txt')} ./line-list-of-cases.txt"
      puts "Command: #{command}"
      puts system(command)

      command =
        "git add ./line-list-of-deaths.txt; git add ./line-list-of-cases.txt; git commit --date \"#{date}\" -m \"#{date} update\""
      puts "Command: #{command}"
      puts system(command)
    end

    command = 'git remote add origin git@github.com:endymion/line-lists--florida-department-of-health.git; git push -fu origin master'
    puts "Command: #{command}"
    puts system(command)
  end
end
