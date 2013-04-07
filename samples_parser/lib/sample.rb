class Sample
  REGEXS = {
    population_count: /liczebność populacji:\s*(\d+)/,
    generations_limit: /liczba pokoleń:\s*(\d+)/,
    crossover_prob: /prawdopodobieństwo krzyżowania:\s*(0\.\d{0,2})/,
    mutation_prob: /prawdopodobieństwo mutacji:\s*(0\.\d{0,2})/,
    scaling_method: /Skalowanie(.*)$/,
    selection_method: /Selekcja metodą '?(.*[^'])'?$/,
    elitism_enabled?: /z uwzględnieniem modelu elitarnego/,
    result: /min { f\(X\) } =\s*(-?\d+\.\d+)/,
    achieved_in: /uzyskane w (\d+) pokoleniu/
  }
  COLUMNS = %i[scaling_method selection_method elitism_enabled? crossover_prob mutation_prob result achieved_in]

  def initialize log
    @log = log
  end

  def population_count
    @population_count ||= Float($1) if @log =~ REGEXS[:population_count]
  end

  def generations_limit
    @generations_limit ||= Float($1) if @log =~ REGEXS[:generations_limit]
  end

  def crossover_prob
    @crossover_prob ||= Float($1) if @log =~ REGEXS[:crossover_prob]
  end

  def mutation_prob
    @mutation_prob ||= Float($1) if @log =~ REGEXS[:mutation_prob]
  end

  def scaling_method
    @scaling_method ||= if @log =~ REGEXS[:scaling_method]
      $1.strip
    else
      'bez skalowania'
    end
  end

  def selection_method
    @selection_method ||= $1.strip if @log =~ REGEXS[:selection_method]
  end

  def elitism_enabled?
    @elitism_enabled ||= !(@log =~ REGEXS[:elitism_enabled?]).nil?
  end

  def result
    @result ||= Float($1) if @log =~ REGEXS[:result]
  end

  def achieved_in
    @achieved_in ||= Integer($1) if @log =~ REGEXS[:achieved_in]
  end

  def to_row columns_order = COLUMNS
    columns_order.map { |attr| self.send(attr) }
  end
end
