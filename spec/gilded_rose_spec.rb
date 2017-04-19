require_relative '../model/gilded_rose'

describe GildedRose do

	let(:items) {
		[Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
		 Item.new(name="Aged Brie", sell_in=2, quality=0),
		 Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
		 Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
		 Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
		 Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
		 Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
		 Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
		 Item.new(name="Conjured Mana Cake", sell_in=3, quality=6)] # This Conjured item does not work properly yet
	}

	let(:dexterity_vest) { items[0] }
	let(:aged_brie) { items[1] }
	let(:elixir_of_mongoose) { items[2] }
	let(:sulfuras_sell_in_0) { items[3] }
	let(:sulfuras_sell_in_minus_1) { items[4] }
	let(:backstage_pass_sell_in_15) { items[5] }
	let(:backstage_pass_sell_in_10) { items[6] }
	let(:backstage_pass_sell_in_5) { items[7] }
	let(:conjured_mana_cake) { items[8] }

	let(:update_quality) { GildedRose.new(items).update_quality() }

  describe "#update_quality" do

  	describe "general items" do

	    it "doesn't change item's names" do
	      expect{update_quality}.to_not change{dexterity_vest.name}
	    end

	    it "decreases sell_in everyday" do
	    	dexterity_vest.sell_in = 1
	      expect{update_quality}.to change{dexterity_vest.sell_in}.by(-1)
	    end

	    it "decreases quality everyday" do
	    	dexterity_vest.sell_in = 1
	    	dexterity_vest.quality = 1
	      expect{update_quality}.to change{dexterity_vest.quality}.by(-1)
	    end

	    it "degrades twice as fast when expired" do
	    	dexterity_vest.sell_in = 0
	    	dexterity_vest.quality = 2
	      expect{update_quality}.to change{dexterity_vest.quality}.by(-2)
	    end

	    it "doesn't negativate quality" do
	    	dexterity_vest.quality = 0
	      expect{update_quality}.to_not change{dexterity_vest.quality}
	    end

  	end

    describe "aged brie" do

	    it "gets better with time" do
	    	aged_brie.quality = 49
	      expect{update_quality}.to change{aged_brie.quality}.by(1)
	    end

	    it "doesn't surpass 50 of quality" do
	    	aged_brie.quality = 50
	      expect{update_quality}.to_not change{aged_brie.quality}
	    end

    end

    describe "sulfuras" do

	    it "has permanent quality of 80" do
	      expect{update_quality}.to_not change{sulfuras_sell_in_0.quality}.from(80)
	      expect{update_quality}.to_not change{sulfuras_sell_in_minus_1.quality}.from(80)
	    end

	    it "doesn't decreases sell_in" do
	      expect{update_quality}.to_not change{sulfuras_sell_in_0.sell_in}
	      expect{update_quality}.to_not change{sulfuras_sell_in_minus_1.sell_in}
	    end

    end

    describe "backstage passes" do

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

    describe "conjured items" do
      it "degrades twice as fast" do
    		skip
      	conjured_mana_cake.sell_in = 10
      	conjured_mana_cake.quality = 2
        expect{update_quality}.to change{conjured_mana_cake.quality}.by(-2)
      end

    end

  end

end
