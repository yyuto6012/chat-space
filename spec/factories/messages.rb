FactoryGirl.define do

  factory :message do
    body 'techcamp'
    image Faker::Avatar.image
    user
    group
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end
