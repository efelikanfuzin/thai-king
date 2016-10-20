class UsersController < ApplicationController
  # POST /users
  def create
    @user = User.find_or_initialize_by(user_params)

    if @user.save
      render :show, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :device_id)
  end
end
