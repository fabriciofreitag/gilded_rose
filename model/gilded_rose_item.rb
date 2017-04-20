require_relative 'item'

class GildedRoseItem < Item

  def initialize(args)
    super(name=args[:name], sell_in=args[:sell_in], quality=args[:quality])
  end

  def increase_quality
    self.quality += 1 unless shighest_quality_reached?
  end

  def decrease_quality
    self.quality -= 1 unless lowest_quality_reached?
  end

  def expired?
    self.sell_in < 0
  end

private

  def lowest_quality_reached?
    self.quality < 1
  end

  def highest_quality_reached?
    self.quality == 50
  end

end