require 'fileutils'
require 'colorize'

class Cache

  def self.cache_filename key
    path = File.join('.scraper-cache', key)

    # Ensure that the cache folder exists.
    path_names = path.split(File::SEPARATOR)
    path_names.pop
    FileUtils.mkdir_p path_names.join File::SEPARATOR

    path
  end

  # Loads a value from a cached file.
  # The key must be a valid Unix path.
  # Returns the contents of the file as a string.
  def self.load key
    unless File.exist? cache_filename(key)
      puts '[not cached] '.red + key.gray
      value = yield
      File.open(cache_filename(key), "wb") do |file|
        file.write(value)
      end
      value
    else
      puts '[cached] '.green + key.gray
      File.read cache_filename(key)
    end
  end

  # Generates a cached file using the block passed.
  # The key must be a valid Unix path.
  # Returns nothing.  You have to get the data yourself.
  # Does nothing if the file already exists.
  def self.generate key
    unless File.exist? cache_filename(key)
      puts '[generating] '.red + key.gray
      value = yield
    else
      puts '[cached] '.green + key.gray
      File.read cache_filename(key)
    end
  end

  # Returns the path name of the cached file.
  def self.file key
    unless File.exist? cache_filename(key)
      value = yield
      File.open(cache_filename(key), "wb") do |file|
        file.write(value)
      end
      cache_filename(key)
    else
      puts '[cached] '.green + key.gray
      cache_filename(key)
    end
  end

end
