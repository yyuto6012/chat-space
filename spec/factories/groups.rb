FactoryGirl.define do

  factory :group do
    group_name "aa"
    created_at { Faker::Time.between(3.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(3.days.ago, Time.now, :all) }
  end

end
