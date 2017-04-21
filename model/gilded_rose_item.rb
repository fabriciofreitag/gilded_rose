require_relative 'item'

module GildedRoseItem
  extend Forwardable
  attr_reader :item

  delegate [:to_s, :name, :sell_in, :quality, :name=, :sell_in=, :quality=] => :item

  def initialize(**args)
    @item = Item.new(name=args[:name], sell_in=args[:sell_in], quality=args[:quality])
  end

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