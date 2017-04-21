require_relative '../gilded_rose_item'

module SubItems
  class AgedBrie < GildedRoseItem
    def update_item
      decrease_sell_in
      change_quality_by(expired? ? 2 : 1)
    end
  end
end