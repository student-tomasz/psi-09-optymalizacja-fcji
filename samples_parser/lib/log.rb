class Log
  DELIMITER = '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
  COLUMNS = %i[scaling_method selection_method elitism_enabled? crossover_prob mutation_prob result achieved_in]

  def initialize log_path
    @log_path = log_path
  end

  def to_table
    @table ||= samples.map { |sample| sample.to_row(COLUMNS) }
  end

  private
  def samples
    @samples ||= File.read(@log_path).split(DELIMITER)[2..-2].map { |sample_log| Sample.new sample_log }
  end
end
