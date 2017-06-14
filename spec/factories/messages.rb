FactoryGirl.define do

  factory :message do
    body 'techcamp'
    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec/fixtures/files/test.png'))) }
    user
    group
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end
