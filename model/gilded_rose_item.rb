require_relative 'item'

class GildedRoseItem < Item

  def initialize(args)
    super(name=args[:name], sell_in=args[:sell_in], quality=args[:quality])
  end

  def update_item
    decrease_sell_in
    decrease_quality_by(expired? ? 2 : 1)
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
    self.quality == 0
  end

  def highest_quality_reached?
    self.quality == 50
  end

end