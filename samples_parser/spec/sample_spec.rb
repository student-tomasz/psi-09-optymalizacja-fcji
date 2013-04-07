require 'spec_helper'
require 'sample'

describe Sample do
  let(:ble) { Sample.new read_sample_file 'skal-brak_sel-los_elit.txt' }
  let(:rt) { Sample.new read_sample_file 'skal-rank_sel-turn.txt' }
  let(:lt) { Sample.new read_sample_file 'skal-lin_sel-turn.txt' }
  let(:samples) { [ble, rt, lt] }

  describe '.population_count' do
    it "returns population" do
      samples.each { |sample| expect(sample.population_count).to eq 30 }
    end
  end

  describe '.generations_limit' do
    it "returns generations limit" do
      samples.each { |sample| expect(sample.generations_limit).to eq 1000 }
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

  describe '.scaling_method' do
    it "returns scaling method" do
      expect(ble.scaling_method).to be_nil
      expect(rt.scaling_method).to eq 'rankingowe wykładnicze'
      expect(lt.scaling_method).to eq 'liniowe'
    end
  end

  describe '.selection_method' do
    it "returns selection method" do
      expect(ble.selection_method).to eq 'wyboru losowego z powtórzeniami'
      expect(rt.selection_method).to eq 'turniejów losowych'
      expect(lt.selection_method).to eq 'turniejów losowych'
    end
  end

  describe '.elitism_enabled?' do
    it "returns whether elitism was enabled" do
      expect(ble.elitism_enabled?).to be_true
      expect(rt.elitism_enabled?).to be_false
      expect(lt.elitism_enabled?).to be_false
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
    context "with default columns" do
      subject(:rows) { samples.map { |sample| sample.to_row }}

      it "returns an array" do
        rows.each { |row| expect(row).to be_an Array }
      end

      it "returns 7 values" do
        rows.each { |row| expect(row.length).to eq 7 }
      end

      it "returns values in order" do
        expect(ble.to_row).to eq [nil, 'wyboru losowego z powtórzeniami', true, 0.02, 0.07, 0.39990, 717]
        expect(rt.to_row).to eq ['rankingowe wykładnicze', 'turniejów losowych', false, 0.07, 0.07, 0.39796, 860]
        expect(lt.to_row).to eq ['liniowe', 'turniejów losowych', false, 0.50, 0.70, 0.39850, 816]
      end
    end

    context "with specified columns" do
      let(:columns_order) { %i[scaling_method crossover_prob mutation_prob] }
      subject(:rows) { samples.map { |sample| sample.to_row(columns_order) }}

      it "returns an array" do
        rows.each { |row| expect(row).to be_an Array }
      end

      it "returns 3 values" do
        rows.each { |row| expect(row.length).to eq columns_order.length }
      end

      it "returns values in order" do
        expect(ble.to_row(columns_order)).to eq [nil, 0.02, 0.07]
        expect(rt.to_row(columns_order)).to eq ['rankingowe wykładnicze', 0.07, 0.07]
        expect(lt.to_row(columns_order)).to eq ['liniowe', 0.50, 0.70]
      end
    end
  end
end
