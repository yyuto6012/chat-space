require 'rails_helper'

  describe Message, type: :model do

    it 'is valid' do
      message = build(:message)
      expect(message).to be_valid
    end

    it 'is invalid without a body' do
      message = build(:message, body: nil)
      message.valid?
      binding.pry
      expect(message.errors[:body]).to include("を入力してください。")
    end

    it 'is invalid without a user_id' do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user]).to include("を入力してください")
    end

    it 'is invalid without a group_id' do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group]).to include("を入力してください")
    end

end