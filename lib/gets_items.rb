class GetsItems
  unloadable

  def self.item_rows
    Item.all.each_slice(3).to_a
  end

  def self.item(id)
    Item.find(id)
  end
end
