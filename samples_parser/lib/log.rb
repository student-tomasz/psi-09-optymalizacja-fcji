require 'csv'
require 'sample'

class Log
  DELIMITER = '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
  COLUMNS = {
    scaling_method: 'Metoda skalowania',
    selection_method: 'Metoda selekcji',
    elitism_enabled?: 'Elitaryzm',
    crossover_prob: 'Prawdopodobieństwo krzyżowania',
    mutation_prob: 'Prawdopodobieństwo mutacji',
    result: 'Wynik',
    achieved_in: 'Osiągnięty w generacji'
  }

  def initialize log_path
    @log_path = log_path
  end

  def to_table
    @table ||= samples.map { |sample| sample.to_row(COLUMNS.keys) }
  end

  def to_csv(headers: false)
    csv_table.to_csv(write_headers: headers)
  end

  private
  def samples
    @samples ||= File.read(@log_path).split(DELIMITER)[2..-2].map { |sample_log| Sample.new sample_log }
  end

  def csv_table
    @csv_table ||= init_csv_table
  end

  def init_csv_table
    header_row = CSV::Row.new(COLUMNS.values, COLUMNS.keys, true)
    rows = self.to_table.map { |row| CSV::Row.new(COLUMNS.keys, row) }
    rows.unshift header_row
    CSV::Table.new rows
  end
end
