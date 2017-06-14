  require 'rails_helper'

  describe Message, type: :model do

    it 'is valid' do
      message = create(:message)
      expect(message).to be_valid
    end

    it 'is valid with a image although without a body' do
      message = build(:message, body: nil)
      binding.pry
      expect(message).to be_valid
    end

    it 'is invalid without a body and an image' do
      message = build(:message, body: nil, image: nil)
      binding.pry
      expect(message).not_to be_valid
      expect(message.errors).to include("テキストまたはイメージを入力してください。")
    end

    it 'is invalid without a user_id' do
      message = build(:message, user_id: nil)
      expect(message).not_to be_valid
      expect(message.errors[:user_id]).to include("を入力してください。")
    end

    it 'is invalid without a group_id' do
      message = build(:message, group_id: nil)
      expect(message).not_to be_valid
      expect(message.errors[:group_id]).to include("を入力してください。")
    end

end
