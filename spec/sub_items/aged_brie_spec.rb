require 'spec_helper'

describe SubItems::AgedBrie do

  let(:items) { [SubItems::AgedBrie.new(name: 'Aged Brie', sell_in: 2, quality: 0)] }
  let(:aged_brie) { items[0] }
  let(:update_quality) { GildedRose.new(items).update_quality }

  it 'doesnt surpass 50 of quality' do
    aged_brie.quality = 50
    expect{update_quality}.to_not change{aged_brie.quality}
  end

  context 'when there are no sell_in days' do
    it 'increases quality by 2' do
      aged_brie.sell_in = 0
      aged_brie.quality = 0
      expect{update_quality}.to change{aged_brie.quality}.by(2)
    end
  end

  context 'when there are remaining sell_in days' do
    it 'increases quality by 1' do
    aged_brie.sell_in = 10
    aged_brie.quality = 49
    expect{update_quality}.to change{aged_brie.quality}.by(1)
    end
  end

end