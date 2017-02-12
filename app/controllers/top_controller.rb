class TopController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @groups = Group.order("created_at DESC")
  end

end
