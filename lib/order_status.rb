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

  def self.for_select
    constants.map { |status|  [OrderStatus.const_get(status).capitalize, 
                              OrderStatus.const_get(status)] }
  end
end
