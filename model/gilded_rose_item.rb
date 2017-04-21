require_relative 'item'

class GildedRoseItem < Item

  def initialize(args)
    super(name=args[:name], sell_in=args[:sell_in], quality=args[:quality])
  end

  def update_item
    return if is? 'Sulfuras, Hand of Ragnaros'
    decrease_sell_in
    if is? 'Backstage passes to a TAFKAL80ETC concert'
      value = -self.quality if expired?
      value = 1 if self.sell_in > 10
      value = 2 if self.sell_in.between?(6, 10)
      value = 3 if self.sell_in.between?(1, 5)
    else
      value = is? 'Aged Brie' ? 1 : -1
      value *= 2 if expired?
    end
    change_quality_by(value)
  end

private

  def is?(name)
    self.name == name
  end

  def change_quality_by(amount)
    amount < 1 ? decrease_quality_by(amount.abs) : increase_quality_by(amount.abs)
  end

  def increase_quality_by(amount)
    amount.times { increase_quality unless highest_quality_reached? }
  end

  def decrease_quality_by(amount)
    amount.times { decrease_quality unless lowest_quality_reached? }
  end

  def increase_quality
    self.quality += 1
  end

  def decrease_quality
    self.quality -= 1
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