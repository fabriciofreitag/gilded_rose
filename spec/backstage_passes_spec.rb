require 'spec_helper'

describe 'backstage passes' do

  let(:items) {[GildedRoseItem.new(name: 'Backstage passes to a TAFKAL80ETC concert',
                                   sell_in: 15,
                                   quality: 20)]}

  let(:backstage_pass) { items[0] }
  let(:update_quality) { GildedRose.new(items).update_quality() }

  context 'when it is more than 10 days before the concert' do
    it 'increases in quality by 1' do
      backstage_pass.sell_in = 15
      expect{update_quality}.to change{backstage_pass.quality}.by(1)
    end
  end

  context 'when it is less than 10 and more than 6 days before the concert' do
    it 'increases in quality by 2' do
      backstage_pass.sell_in = 10
      expect{update_quality}.to change{backstage_pass.quality}.by(2)
    end
  end

  context 'when it is less than 6 days before the concert' do
    it 'increases in quality by 3' do
      backstage_pass.sell_in = 5
      expect{update_quality}.to change{backstage_pass.quality}.by(3)
    end
  end

  context 'after the concert' do
    it 'sets quality to 0' do
    backstage_pass.sell_in = -1
    backstage_pass.quality = 50
    expect{update_quality}.to change{backstage_pass.quality}.from(50).to(0)
    end
  end

end