[["Pepperoni Pizza", 9.99], ["Hawaiian Pizza", 9.99], ["Cheese Pizza", 9.99], ["Soda", 2.99]].each do |item|
  Item.find_or_create_by_name_and_price(item[0], item[1])
end
