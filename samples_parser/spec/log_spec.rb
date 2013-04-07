require 'spec_helper'
require 'log'

describe Log do
  let(:log) { Log.new log_path '01.txt' }

  describe '.to_table' do
    subject(:table) { log.to_table }

    it "returns an array of arrays" do
      expect(table).to be_an Array
      table.each { |row| expect(row).to be_an Array }
    end

    it "returns 18 rows" do
      expect(table.length).to eq 18
    end

    it "returns 7 columns" do
      expect(table[0].length).to eq 7
    end

    it "returns correct rows" do
      expect(table[0]).to eq ['rankingowe wykładnicze', 'turniejów losowych', true, 0.70, 0.01, 0.39802, 834]
    end
  end

  describe '.to_csv' do
    context "with default arguments" do
      subject(:csv) { log.to_csv }

      it "returns CSV without headers" do
        expect(csv).to eq <<-EOF
rankingowe wykładnicze,turniejów losowych,true,0.7,0.01,0.39802,834
rankingowe wykładnicze,turniejów losowych,true,0.7,0.02,0.39794,655
rankingowe wykładnicze,turniejów losowych,true,0.7,0.03,0.39989,449
rankingowe wykładnicze,turniejów losowych,true,0.7,0.04,0.40306,648
rankingowe wykładnicze,turniejów losowych,true,0.7,0.05,0.39828,904
rankingowe wykładnicze,turniejów losowych,true,0.7,0.06,0.39841,846
rankingowe wykładnicze,turniejów losowych,true,0.7,0.07,0.3979,618
rankingowe wykładnicze,turniejów losowych,true,0.7,0.08,0.39803,373
rankingowe wykładnicze,turniejów losowych,true,0.7,0.09,0.39798,977
rankingowe wykładnicze,turniejów losowych,true,0.7,0.1,0.3987,856
rankingowe wykładnicze,turniejów losowych,true,0.7,0.2,0.39802,885
rankingowe wykładnicze,turniejów losowych,true,0.7,0.3,0.39791,570
rankingowe wykładnicze,turniejów losowych,true,0.7,0.4,0.3979,974
rankingowe wykładnicze,turniejów losowych,true,0.7,0.5,0.39798,733
rankingowe wykładnicze,turniejów losowych,true,0.7,0.6,0.39872,834
rankingowe wykładnicze,turniejów losowych,true,0.7,0.7,0.3989,786
rankingowe wykładnicze,turniejów losowych,true,0.7,0.8,0.39828,61
rankingowe wykładnicze,turniejów losowych,true,0.7,0.9,0.39795,510
EOF
      end
    end

    context "with headers" do
      subject(:csv) { log.to_csv(headers: true) }

      it "returns CSV with headers" do
        expect(csv).to eq <<-EOF
Metoda skalowania,Metoda selekcji,Elitaryzm,Prawdopodobieństwo krzyżowania,Prawdopodobieństwo mutacji,Wynik,Osiągnięty w generacji
rankingowe wykładnicze,turniejów losowych,true,0.7,0.01,0.39802,834
rankingowe wykładnicze,turniejów losowych,true,0.7,0.02,0.39794,655
rankingowe wykładnicze,turniejów losowych,true,0.7,0.03,0.39989,449
rankingowe wykładnicze,turniejów losowych,true,0.7,0.04,0.40306,648
rankingowe wykładnicze,turniejów losowych,true,0.7,0.05,0.39828,904
rankingowe wykładnicze,turniejów losowych,true,0.7,0.06,0.39841,846
rankingowe wykładnicze,turniejów losowych,true,0.7,0.07,0.3979,618
rankingowe wykładnicze,turniejów losowych,true,0.7,0.08,0.39803,373
rankingowe wykładnicze,turniejów losowych,true,0.7,0.09,0.39798,977
rankingowe wykładnicze,turniejów losowych,true,0.7,0.1,0.3987,856
rankingowe wykładnicze,turniejów losowych,true,0.7,0.2,0.39802,885
rankingowe wykładnicze,turniejów losowych,true,0.7,0.3,0.39791,570
rankingowe wykładnicze,turniejów losowych,true,0.7,0.4,0.3979,974
rankingowe wykładnicze,turniejów losowych,true,0.7,0.5,0.39798,733
rankingowe wykładnicze,turniejów losowych,true,0.7,0.6,0.39872,834
rankingowe wykładnicze,turniejów losowych,true,0.7,0.7,0.3989,786
rankingowe wykładnicze,turniejów losowych,true,0.7,0.8,0.39828,61
rankingowe wykładnicze,turniejów losowych,true,0.7,0.9,0.39795,510
EOF
      end
    end
  end
end
