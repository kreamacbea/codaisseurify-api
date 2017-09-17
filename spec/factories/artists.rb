FactoryGirl.define do
  factory :artist do
    name { Faker::Name.unique.person }
    image { Faker::LoremPixel.unique.image }
  end
end
