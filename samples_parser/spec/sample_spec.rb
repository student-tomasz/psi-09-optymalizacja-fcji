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
end
