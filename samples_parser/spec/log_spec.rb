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
end
