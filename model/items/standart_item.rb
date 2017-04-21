require_relative '../gilded_rose_item'

module Items
  class StandartItem
    include GildedRoseItem

    def update_item
      decrease_sell_in
      decrease_quality_by(expired? ? 2 : 1)
    end
  end
end