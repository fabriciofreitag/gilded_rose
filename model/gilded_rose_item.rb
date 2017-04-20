require_relative 'item'

class GildedRoseItem < Item

  def initialize(args)
    super(name=args[:name], sell_in=args[:sell_in], quality=args[:quality])
  end

  def is?(name)
    self.name == name
  end

  def is_not?(name)
    !is?(name)
  end

  def increase_quality
    self.quality += 1 if self.quality < 50
  end

  def quality_limit_reached?
    self.quality < 50
  end

  def decrease_quality
    self.quality -= 1 if self.quality > 0
  end

  def expired?
    self.sell_in < 0
  end

end