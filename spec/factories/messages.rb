FactoryGirl.define do

  factory :message do
    id    Faker::Number.digit
    body 'techcamp'
    image Faker::Avatar.image
    user_id Faker::Number.digit
    group_id Faker::Number.digit
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end