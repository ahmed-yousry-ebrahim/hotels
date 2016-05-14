FactoryGirl.define do
  factory :hotel do |hotel|
    hotel.sequence(:name) { |n| "Hotel #{n}" }
    hotel.sequence(:address) { |n| "Address #{n}" }
    star_rating {rand(1..5)}
    accomodation_type_id {rand(1..5)}
  end

end