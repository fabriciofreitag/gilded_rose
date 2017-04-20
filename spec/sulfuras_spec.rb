require 'spec_helper'

describe 'sulfuras' do

  let(:items) { [GildedRoseItem.new(name: 'Sulfuras, Hand of Ragnaros', sell_in: 0, quality: 80)] }
  let(:sulfuras) { items[0] }
  let(:update_quality) { GildedRose.new(items).update_quality() }

  it 'has permanent quality of 80' do
    expect{update_quality}.to_not change{sulfuras.quality}.from(80)
  end

  it 'doesnt decreases sell_in' do
    expect{update_quality}.to_not change{sulfuras.sell_in}
  end

end