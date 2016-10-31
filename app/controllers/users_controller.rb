class UsersController < ApplicationController
  before_action :set_user, only: :update
  before_action :require_auth, only: :update

  # POST /users
  def create
    @user = User.find_or_initialize_by(user_params.permit(:device_id))
    @user.create_session

    if @user.save
      render :show, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    unless @current_user.try(:id) == params[:id].to_i
      render head(:unauthorized) && return
    end

    @user.update_attributes(user_params.permit(:balance, passed_questions: []))
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :balance, :device_id,
                                 passed_questions: [])
  end

  def set_user
    @user = User.find_by(id: params[:id])
    render head :not_found unless @user
  end
end
