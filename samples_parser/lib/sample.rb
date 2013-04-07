class Sample
  REGEXS = {
    population: /liczebność populacji:\s*(\d+)/,
    generations: /liczba pokoleń:\s*(\d+)/,
    crossover_prob: /prawdopodobieństwo krzyżowania:\s*(0\.\d{0,2})/,
    mutation_prob: /prawdopodobieństwo mutacji:\s*(0\.\d{0,2})/,
  }

  def initialize log
    @log = log
  end

  def population
    @population ||= Float($1) if @log =~ REGEXS[:population]
  end

  def generations
    @generations ||= Float($1) if @log =~ REGEXS[:generations]
  end

  def crossover_prob
    @crossover_prob ||= Float($1) if @log =~ REGEXS[:crossover_prob]
  end

  def mutation_prob
    @mutation_prob ||= Float($1) if @log =~ REGEXS[:mutation_prob]
  end
end
