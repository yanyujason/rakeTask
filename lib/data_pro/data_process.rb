module DataPro
  class DataProcess
    def grouping filename
      file = CSV.read(File.path(filename))
      group_list = []
      group = []
      file.each_with_index do |row, row_index|
        unless row_index < 1
          (file[row_index + 1].eql? nil) ? next_row = [] : next_row = file[row_index + 1]
          (next_row.eql? []) ? next_value = nil : (next_value = next_row[0] + next_row[1] + next_row[2] + next_row[3])
          current_value = row[0] + row[1] + row[2] + row[3]
          group << row
          unless next_value.eql? current_value
            group_list << group
            group = []
          end
        end
      end
      grouped_data = []
      group_list.each_with_index do |list, index|
        sum = 0
        count = 0
        list.each do |element|
          sum += element[5].to_f
          count += 1
        end
        grouped_data << (list[0][0..3] << (sum/count))
      end
      grouped_data
    end

    def filtering filename, maximum, minimum
      file = CSV.read(File.path(filename))
      filter = []
      file.each_with_index do |row, row_index|
        unless row_index < 2
          filter << row if (row[5].to_f > minimum.to_f && row[5].to_f < maximum.to_f)
        end
      end
      filter
    end

    def sorting filename
      file = CSV.read(File.path(filename))
      cheap = file.sort do |a, b|
        a[5].to_f <=> b[5].to_f
      end
    end
  end
end