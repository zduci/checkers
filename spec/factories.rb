FactoryGirl.define do
  factory :admin, :class => Admin do
    email 'pizzamanager@checkers.co.uk'
    password 'onetwothree'
  end

  factory :item do
    name "Cheese Pizza"
    price 9.99
    description "Very cheesy"
  end
end
