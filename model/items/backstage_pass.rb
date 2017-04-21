require_relative '../gilded_rose_item'

module Items
  class BackstagePass
    include GildedRoseItem

    def update_item
      decrease_sell_in
      value = -self.quality if expired?
      value = 1 if self.sell_in > 10
      value = 2 if self.sell_in.between?(6, 10)
      value = 3 if self.sell_in.between?(1, 5)
      change_quality_by(value)
    end
  end
end