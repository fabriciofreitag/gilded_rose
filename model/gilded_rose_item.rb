require_relative 'item'

module GildedRoseItem
  extend Forwardable
  attr_reader :item

  HIGHEST_POSSIBLE_QUALITY = 50
  LOWEST_POSSIBLE_QUALITY = 0

  delegate [:to_s, :name, :sell_in, :quality, :name=, :sell_in=, :quality=] => :item

  def initialize(**args)
    @item = Item.new(name=args[:name], sell_in=args[:sell_in], quality=args[:quality])
  end

  def is?(name)
    self.name == name
  end

  def change_quality_by(amount)
    self.quality += amount
    self.quality = HIGHEST_POSSIBLE_QUALITY if self.quality > HIGHEST_POSSIBLE_QUALITY
    self.quality = LOWEST_POSSIBLE_QUALITY if self.quality < LOWEST_POSSIBLE_QUALITY
  end

  def decrease_sell_in
    self.sell_in -= 1
  end

  def expired?
    self.sell_in < 1
  end

end