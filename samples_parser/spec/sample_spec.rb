require 'spec_helper'
require 'sample'

describe Sample do
  # skalowanie+selekcja+elitaryzm
  let(:ble) do
    sample_log = <<-EOS

%%%%%%%%%%%%%%%%%%%% Wyniki2 %%%%%%%%%%%%%%%%%%%%%

 Rozpoczęcie obiczeń:  godz. 00:43:22.830

  Funkcja Branin'a RCOS
   - jest to funkcja dwuwymiarowa
   Przedziały zmienności argumentów:
    - x1: < -5; 10 >
    - x2: < 10; 15 >
   Maksymalna wartość funkcji w danym obszarze
   wynosi 212.83131
   Funkcja przyjmuje globalną wartość minimalną
   0.397887 w trzech różnych punktach:
   ( x1, x2 ) = ( -3.14...; 12,275 )
    ( 3.14...; 2.275 ) oraz ( 9.42478; 2.475 )

  Parametry genetyczne:
   - liczebność populacji:    30
   - liczba pokoleń:        1000
   - prawdopodobieństwo krzyżowania: 0.02
   - prawdopodobieństwo mutacji:     0.07

  Selekcja metodą wyboru losowego z powtórzeniami
   z uwzględnieniem modelu elitarnego

  Wyniki obliczeń:
    min { f(X) } =   0.39990
      dla:
        x1 =  -3.16202
        x2 =  12.32231
    uzyskane w 717 pokoleniu

 Zakończenie obliczeń: godz. 00:43:22.906

    EOS
    Sample.new(sample_log)
  end

  let(:rt) do
    sample_log = <<-EOS

%%%%%%%%%%%%%%%%%%%% Wyniki7 %%%%%%%%%%%%%%%%%%%%%

 Rozpoczęcie obiczeń:  godz. 13:32:40.181

  Funkcja Branin'a RCOS
   - jest to funkcja dwuwymiarowa
   Przedziały zmienności argumentów:
    - x1: < -5; 10 >
    - x2: < 10; 15 >
   Maksymalna wartość funkcji w danym obszarze
   wynosi 212.83131
   Funkcja przyjmuje globalną wartość minimalną
   0.397887 w trzech różnych punktach:
   ( x1, x2 ) = ( -3.14...; 12,275 )
    ( 3.14...; 2.275 ) oraz ( 9.42478; 2.475 )

  Parametry genetyczne:
   - liczebność populacji:    30
   - liczba pokoleń:        1000
   - prawdopodobieństwo krzyżowania: 0.07
   - prawdopodobieństwo mutacji:     0.07

  Skalowanie rankingowe wykładnicze
   - c = 100.0
   - r = 0.9

  Selekcja metodą 'turniejów losowych'
  Wyniki obliczeń:
    min { f(X) } =   0.39796
      dla:
        x1 =  -3.13776
        x2 =  12.26768
    uzyskane w 860 pokoleniu

 Zakończenie obliczeń: godz. 13:32:40.261

    EOS
    Sample.new(sample_log)
  end

  let(:lt) do
    sample_log = <<-EOS

%%%%%%%%%%%%%%%%%%%% Wyniki16 %%%%%%%%%%%%%%%%%%%%%

 Rozpoczęcie obiczeń:  godz. 13:31:45.461

  Funkcja Branin'a RCOS
   - jest to funkcja dwuwymiarowa
   Przedziały zmienności argumentów:
    - x1: < -5; 10 >
    - x2: < 10; 15 >
   Maksymalna wartość funkcji w danym obszarze
   wynosi 212.83131
   Funkcja przyjmuje globalną wartość minimalną
   0.397887 w trzech różnych punktach:
   ( x1, x2 ) = ( -3.14...; 12,275 )
    ( 3.14...; 2.275 ) oraz ( 9.42478; 2.475 )

  Parametry genetyczne:
   - liczebność populacji:    30
   - liczba pokoleń:        1000
   - prawdopodobieństwo krzyżowania: 0.50
   - prawdopodobieństwo mutacji:     0.70

  Skalowanie liniowe
   - współczynnik zwielokrotnienia: 2.0

  Selekcja metodą 'turniejów losowych'
  Wyniki obliczeń:
    min { f(X) } =   0.39850
      dla:
        x1 =  -3.15287
        x2 =  12.30049
    uzyskane w 816 pokoleniu

 Zakończenie obliczeń: godz. 13:31:45.538

    EOS
    Sample.new(sample_log)
  end

  let(:samples) { [ble, rt, lt] }

  describe '.population' do
    it "returns samples's population" do
      samples.each { |sample| expect(sample.population).to eq 30 }
    end
  end

  describe '.generations' do
    it "returns samples's generations" do
      samples.each { |sample| expect(sample.generations).to eq 1000 }
    end
  end

  describe '.crossover_prob' do
    it "returns samples's crossover probability" do
      expect(ble.crossover_prob).to eq 0.02
      expect(rt.crossover_prob).to eq 0.07
      expect(lt.crossover_prob).to eq 0.50
    end
  end

  describe '.mutation_prob' do
    it "returns samples's mutation probability" do
      expect(ble.mutation_prob).to eq 0.07
      expect(rt.mutation_prob).to eq 0.07
      expect(lt.mutation_prob).to eq 0.70
    end
  end

  describe '.scaling' do
    it "returns scaling method" do
      expect(ble.scaling).to be_nil
      expect(rt.scaling).to eq 'rankingowe wykładnicze'
      expect(lt.scaling).to eq 'liniowe'
    end
  end

  describe '.selection' do
    it "returns selection method" do
      expect(ble.selection).to eq 'wyboru losowego z powtórzeniami'
      expect(rt.selection).to eq 'turniejów losowych'
      expect(lt.selection).to eq 'turniejów losowych'
    end
  end

  describe '.elitism' do
    it "returns whether elitism was enabled" do
      expect(ble.elitism).to be_true
      expect(rt.elitism).to be_false
      expect(lt.elitism).to be_false
    end
  end

  describe '.result' do
    it "returns result value" do
      expect(ble.result).to eq 0.39990
      expect(rt.result).to eq 0.39796
      expect(lt.result).to eq 0.39850
    end
  end

  describe '.achieved_in' do
    it "returns generation that achieved the result" do
      expect(ble.achieved_in).to eq 717
      expect(rt.achieved_in).to eq 860
      expect(lt.achieved_in).to eq 816
    end
  end

  describe '.to_row' do
    it "returns an array" do
      samples.each { |sample| expect(sample.to_row).to be_an Array }
    end

    it "returns 7 values" do
      samples.each { |sample| expect(sample.to_row.length).to eq 7 }
    end

    it "returns values in order" do
      expect(ble.to_row).to eq [nil, 'wyboru losowego z powtórzeniami', true, 0.02, 0.07, 0.39990, 717]
      expect(rt.to_row).to eq ['rankingowe wykładnicze', 'turniejów losowych', false, 0.07, 0.07, 0.39796, 860]
      expect(lt.to_row).to eq ['liniowe', 'turniejów losowych', false, 0.50, 0.70, 0.39850, 816]
    end
  end
end
