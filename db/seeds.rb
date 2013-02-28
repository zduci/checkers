[["Pepperoni Pizza", 9.99, "Contains pepperoni, ham, and tomatoe sauce"],
  ["Hawaiian Pizza", 9.99, "Ham + pineapple = <3"],
  ["Cheese Pizza", 9.99, "Very cheesy"],
  ["Soda", 2.99, "Deadly eventually"]].each do |item|
  Item.find_or_create_by_name_and_price_and_description(item[0], item[1], item[2])
end
