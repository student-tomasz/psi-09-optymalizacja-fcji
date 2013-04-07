require 'pry'

class Sample
  REGEXS = {
    population: /liczebność populacji:\s*(\d+)/,
    generations: /liczba pokoleń:\s*(\d+)/,
    crossover_prob: /prawdopodobieństwo krzyżowania:\s*(0\.\d{0,2})/,
    mutation_prob: /prawdopodobieństwo mutacji:\s*(0\.\d{0,2})/,
    scaling: /Skalowanie(.*)$/,
    selection: /Selekcja metodą '?(.*[^'])'?$/,
    elitism: /z uwzględnieniem modelu elitarnego/,
    result: /min { f\(X\) } =\s*(-?\d+\.\d+)/,
    achieved_in: /uzyskane w (\d+) pokoleniu/
  }
  COLUMNS = %i[scaling selection elitism crossover_prob mutation_prob result achieved_in]

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

  def scaling
    @scaling ||= $1.strip if @log =~ REGEXS[:scaling]
  end

  def selection
    @selection ||= $1.strip if @log =~ REGEXS[:selection]
  end

  def elitism
    @elitism ||= !(@log =~ REGEXS[:elitism]).nil?
  end

  def result
    @result ||= Float($1) if @log =~ REGEXS[:result]
  end

  def achieved_in
    @achieved_in ||= Integer($1) if @log =~ REGEXS[:achieved_in]
  end

  def to_row
    COLUMNS.map { |attr| self.send(attr) }
  end
end
