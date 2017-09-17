FactoryGirl.define do
  factory :song do
    title { Faker::Book.unique.title }
  end
end
