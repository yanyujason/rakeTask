require 'rake'
require 'csv'

Dir.glob('tasks/*.rake').each { |r| import r }

require File.expand_path('../lib/data_pro/data_process.rb', __FILE__)

desc 'Run all rake tasks'
task :default => %w(data_processing:grouping data_processing:filtering data_processing:sorting)