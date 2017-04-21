require 'spec_helper'

describe 'conjured items' do

  let(:items) { [GildedRoseItem.new(name: 'Conjured Mana Cake', sell_in: 3, quality: 6)] }
  let(:conjured_mana_cake) { items[0] }
  let(:update_quality) { GildedRose.new(items).update_quality() }

  it 'degrades twice as fast' do
    skip
    conjured_mana_cake.sell_in = 10
    conjured_mana_cake.quality = 2
    expect{update_quality}.to change{conjured_mana_cake.quality}.by(-2)
  end

end