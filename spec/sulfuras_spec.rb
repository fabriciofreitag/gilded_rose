describe "sulfuras" do

	let(:items) { [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
	  						 Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80)] }

	let(:sulfuras_sell_in_0) { items[0] }
	let(:sulfuras_sell_in_minus_1) { items[1] }
	let(:update_quality) { GildedRose.new(items).update_quality() }

	it "has permanent quality of 80" do
		expect{update_quality}.to_not change{sulfuras_sell_in_0.quality}.from(80)
		expect{update_quality}.to_not change{sulfuras_sell_in_minus_1.quality}.from(80)
	end

	it "doesn't decreases sell_in" do
		expect{update_quality}.to_not change{sulfuras_sell_in_0.sell_in}
		expect{update_quality}.to_not change{sulfuras_sell_in_minus_1.sell_in}
	end

end