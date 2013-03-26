FactoryGirl.define do
  factory :admin, :class => Admin do
    email 'pizzadmin@checkers.co.uk'
    password 'onetwothree'
  end
end
