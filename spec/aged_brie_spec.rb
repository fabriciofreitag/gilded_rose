require_relative '../model/gilded_rose'

describe "aged brie" do

	let(:items) { [Item.new(name="Aged Brie", sell_in=2, quality=0)] }
	let(:aged_brie) { items[0] }
	let(:update_quality) { GildedRose.new(items).update_quality() }

	it "gets even better with time when there are no sell_in days" do
		aged_brie.sell_in = 0
		aged_brie.quality = 0
		expect{update_quality}.to change{aged_brie.quality}.by(2)
	end

	it "gets better with time when there are still sell_in days" do
		aged_brie.sell_in = 10
		aged_brie.quality = 49
		expect{update_quality}.to change{aged_brie.quality}.by(1)
	end

	it "doesn't surpass 50 of quality" do
		aged_brie.quality = 50
		expect{update_quality}.to_not change{aged_brie.quality}
	end

end