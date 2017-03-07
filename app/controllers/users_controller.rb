class UsersController < ApplicationController
  def search
    @users = User.where('name LIKE(?)',"%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end
end
