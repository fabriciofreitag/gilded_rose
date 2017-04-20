require_relative '../model/gilded_rose'

describe "backstage passes" do

	let(:items) {[
		Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
		Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
		Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49)
	]}

	let(:backstage_pass_sell_in_15) { items[0] }
	let(:backstage_pass_sell_in_10) { items[1] }
	let(:backstage_pass_sell_in_5) { items[2] }
	let(:update_quality) { GildedRose.new(items).update_quality() }

	it "increases quality by 1 when sell_in is more than 10" do
		backstage_pass_sell_in_15.quality = 0
		expect{update_quality}.to change{backstage_pass_sell_in_15.quality}.by(1)
	end

	it "increases quality by 2 when sell_in is within 6 to 10 days left" do
		backstage_pass_sell_in_10.quality = 0
		expect{update_quality}.to change{backstage_pass_sell_in_10.quality}.by(2)
	end

	it "increases quality by 3 when there are from 0 to 5 days left" do
		backstage_pass_sell_in_5.quality = 0
		expect{update_quality}.to change{backstage_pass_sell_in_5.quality}.by(3)
	end

	it "drops quality to 0 after concert" do
		backstage_pass_sell_in_5.sell_in = -1
		backstage_pass_sell_in_5.quality = 50
		expect{update_quality}.to change{backstage_pass_sell_in_5.quality}.from(50).to(0)
	end

end