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
  end
end
