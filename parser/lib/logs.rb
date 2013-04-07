require 'log'

class Logs
  def initialize path
    @path = path
  end

  def export_recursively_to_csv!
    logs_paths = Dir.glob(File.join(@path, '**', '*.txt'))
    logs_paths.each do |log_path|
      File.open(csv_path(log_path), 'w') do |csv_file|
        csv_file << Log.new(log_path).to_csv(headers: true)
      end
    end
  end

  private
  def csv_path log_path
    "#{File.dirname(log_path)}/#{File.basename(log_path, '.txt')}.csv"
  end
end
