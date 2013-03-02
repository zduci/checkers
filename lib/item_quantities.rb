class ItemQuantities
  MAX_QUANTITY = 10

  def self.max
    create_for(MAX_QUANTITY)
  end

  def self.create_for(max)
    (1..max).map { |item| [item, item] }
  end
end
