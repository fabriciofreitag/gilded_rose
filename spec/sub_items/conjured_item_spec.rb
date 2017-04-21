require 'spec_helper'

describe Items::ConjuredItem do

  let(:items) { [Items::ConjuredItem.new(name: 'Conjured Mana Cake', sell_in: 3, quality: 6)] }
  let(:conjured_mana_cake) { items[0] }
  let(:update_quality) { GildedRose.new(items).update_quality() }

  context 'when expired' do
    it 'degrades twice as fast' do
      conjured_mana_cake.sell_in = -1
      conjured_mana_cake.quality = 4
      expect{update_quality}.to change{conjured_mana_cake.quality}.by(-4)
    end
  end

  context 'when not expired' do
    it 'degrades faster than other items' do
      conjured_mana_cake.sell_in = 10
      conjured_mana_cake.quality = 2
      expect{update_quality}.to change{conjured_mana_cake.quality}.by(-2)
    end
  end



end