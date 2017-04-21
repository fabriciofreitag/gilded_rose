require_relative 'model/gilded_rose_item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each(&:update_item)
  end

end