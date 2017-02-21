FactoryGirl.define do

  group_id = Faker::Number.digit

  factory :group do
    id         group_id
    group_name "aa"
    created_at { Faker::Time.between(3.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(3.days.ago, Time.now, :all) }
  end

end