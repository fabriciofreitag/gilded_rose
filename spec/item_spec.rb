require 'spec_helper'

describe 'items' do

  let(:items) { [GildedRoseItem.new(name: '+5 Dexterity Vest', sell_in: 10, quality: 20)] }
  let(:dexterity_vest) { items[0] }
  let(:update_quality) { GildedRose.new(items).update_quality }

  it 'doesnt change items names' do
    expect{update_quality}.to_not change{dexterity_vest.name}
  end

  it 'decreases sell_in everyday' do
    dexterity_vest.sell_in = 1
    expect{update_quality}.to change{dexterity_vest.sell_in}.by(-1)
  end

  it 'decreases quality everyday' do
    dexterity_vest.sell_in = 1
    dexterity_vest.quality = 1
    expect{update_quality}.to change{dexterity_vest.quality}.by(-1)
  end

  it 'degrades twice as fast when expired' do
    dexterity_vest.sell_in = 0
    dexterity_vest.quality = 2
    expect{update_quality}.to change{dexterity_vest.quality}.by(-2)
  end

  it 'doesnt negativate quality' do
    dexterity_vest.quality = 0
    expect{update_quality}.to_not change{dexterity_vest.quality}
  end

end