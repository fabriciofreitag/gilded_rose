require_relative 'gilded_rose_item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      update_item(item)
    end
  end

private

  def update_item(item)
    case item.name
    when 'Sulfuras, Hand of Ragnaros'; return
    when 'Aged Brie'
      item.increase_quality
      item.increase_quality if item.sell_in < 1
    when 'Backstage passes to a TAFKAL80ETC concert'
      item.increase_quality
      item.increase_quality if item.sell_in < 11
      item.increase_quality if item.sell_in < 6
      item.quality = 0 if item.expired?
    else
      item.sell_in -= 1
      (item.expired? ? 2 : 1).times { item.decrease_quality }
    end
  end

end