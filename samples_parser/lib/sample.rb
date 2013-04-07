class Sample
  REGEXS = {
    population: /liczebność populacji:\s*(\d+)/,
    generations: /liczba pokoleń:\s*(\d+)/
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
end
