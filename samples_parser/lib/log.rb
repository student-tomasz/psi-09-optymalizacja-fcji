class Log
  DELIMITER = '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'

  def initialize log_path
    @log_path = log_path
  end

  def to_table
    @table ||= samples.map { |sample| sample.to_row }
  end

  private
  def samples
    @samples ||= File.read(@log_path).split(DELIMITER)[2..-2].map { |sample_log| Sample.new sample_log }
  end
end
