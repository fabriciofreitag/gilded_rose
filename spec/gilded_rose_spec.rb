require 'simplecov'
SimpleCov.start

require_relative '../model/gilded_rose'

describe GildedRose do

		let(:items) { [Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)] }
		let(:dexterity_vest) { items[0] }

		describe "#to_s" do
			it "prints the item correctly" do
				expect(dexterity_vest.to_s).to eq("+5 Dexterity Vest, 10, 20")
			end
		end

end