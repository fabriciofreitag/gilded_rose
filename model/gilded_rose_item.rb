require_relative 'item'
require 'byebug'

class GildedRoseItem < Item

  def initialize(args)
    super(name=args[:name], sell_in=args[:sell_in], quality=args[:quality])
  end

  def update_item
    return if is? 'Sulfuras, Hand of Ragnaros'

    decrease_sell_in

    if is? 'Backstage passes to a TAFKAL80ETC concert'
      self.quality = 0 if expired?
      increase_quality(1) if self.sell_in > 10
      increase_quality(2) if self.sell_in.between?(6, 10)
      increase_quality(3) if self.sell_in.between?(1, 5)
    else
      quality_change = is?('Aged Brie') ? 1 : -1
      quality_change *= 2 if expired?
      update_quality(quality_change)
    end

  end

private

  def is?(name)
    self.name == name
  end

  def update_quality(amount)
    amount < 1 ? decrease_quality(amount.abs) : increase_quality(amount.abs)
  end

  def increase_quality(amount)
    amount.times { self.quality += 1 unless highest_quality_reached? }
  end

  def decrease_quality(amount)
    amount.times { self.quality -= 1 unless lowest_quality_reached? }
  end

  def decrease_sell_in
    self.sell_in -= 1
  end

  def expired?
    self.sell_in < 1
  end

  def lowest_quality_reached?
    self.quality < 1
  end

  def highest_quality_reached?
    self.quality == 50
  end

end