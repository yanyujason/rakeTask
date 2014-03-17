namespace :data_processing do

  desc "Data Grouping"
  task :grouping do
    data_file = File.join(File.dirname(__FILE__), 'sold_data.csv')
    grouped = DataPro::DataProcess.new.grouping(data_file)
    outputs grouped
  end

  desc "Data Filtering"
  task :filtering, [:maximum, :minimum] do |task, args|
    args.with_defaults(:maximum => 11100000, :minimum => 0)
    data_file = File.join(File.dirname(__FILE__), 'sold_data.csv')
    filtered = DataPro::DataProcess.new.filtering(data_file, args[:maximum], args[:minimum])
    outputs filtered
  end

  desc "Data Sorting"
  task :sorting do
    data_file = File.join(File.dirname(__FILE__), 'sold_data.csv')
    sorted = DataPro::DataProcess.new.sorting(data_file)
    outputs sorted
  end

  task :hehe do
    p ENV['a']
    p ENV['b']
  end

  private
  def outputs result
    result.each do |data|
      p data
    end
  end
end