module OrderStatus
  PENDING = "pending"
  PLACED = "placed"
  PREPARING = "preparing"
  BAKING = "baking"
  QUALITY_CONTROL = "quality control"
  DELIVERING = "delivering"
  DELIVERED = "delivered"

  def self.all
    constants.map { |status| OrderStatus.const_get(status).capitalize }
  end
end
