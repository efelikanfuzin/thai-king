class ApplicationController < ActionController::Base
  private

  def require_auth
    @current_user = User.find_by(token: request.headers[:token])
  end
end
