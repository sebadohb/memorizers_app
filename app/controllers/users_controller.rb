class UsersController < ApplicationController
  def index
  end
  def show
    @dictionaries = Dictionary.includes(:user).where(user_id: current_user.id)
  end
end
