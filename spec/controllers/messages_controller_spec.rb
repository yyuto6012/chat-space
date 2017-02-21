require 'rails_helper'
RSpec.describe MessagesController, type: :controller do

  let(:user) { create(:user) }
  let(:group) { build(:group) }
  let(:message) { build(:message) }

  before do
    login_user(user)
  end

  describe 'GET #index' do

    it "renders the :index template" do
      get :index, group_id: group.id
      expect(response).to render_template :index
    end

  end

  describe 'POST #create' do

    it "saves a message in the database" do
      expect{
        post :create, group_id: group.id, message: attributes_for(:message)
      }.to change(Message, :count).by(1)
    end

    it "redirects to messages#index" do
      post :create, group_id: group.id, message: attributes_for(:message)
      expect(message).to redirect_to group_messages_path
    end

  end

end


