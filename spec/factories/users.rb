FactoryGirl.define do

  pass = Faker::Internet.password(8)

  factory :user do
    name                  Faker::Name.name
    email                 Faker::Internet.email
    password              pass
    password_confirmation pass
    created_at { Faker::Time.between(4.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(4.days.ago, Time.now, :all) }

    after(:create) do |user|
      user.groups << create(:group)
    end
  end

end