require 'rails_helper'
RSpec.describe MessagesController, type: :controller do

  let(:user)    { create(:user) }
  let(:group)   { create(:group) }
  let(:message) { create(:message, group: group, user: user) }

  before do
    login_user(user)
  end

  describe 'GET #index' do

    before do
      get :index, params: {group_id: group.id}
    end

    it "assigns the requested @group" do
      expect(assigns(:group)).to eq group
    end

    it "populates an array of messages" do
      messages = create_list(:message, 3, group: group)
      expect(assigns(:messages)).to eq messages
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end

  end

  describe 'POST #create' do

    it "saves a message in the database" do
      expect{
        post :create, params: {group_id: group.id, message: attributes_for(:message)}
      }.to change(Message, :count).by(1)
    end

    it "redirects to messages#index" do
      post :create, params: {group_id: group.id, message: attributes_for(:message)}
      expect(message).to redirect_to group_messages_path
    end

  end

end
