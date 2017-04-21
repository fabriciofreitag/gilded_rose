require_relative '../gilded_rose_item'

module Items
  class ConjuredItem < GildedRoseItem
    def update_item
      decrease_sell_in
      change_quality_by(expired? ? -4 : -2)
    end
  end
end