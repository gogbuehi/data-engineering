class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :reset_session

  def require_user
    if !user_signed_in?
      flash[:alert] = "Please sign in before uploading data."
      redirect_to "/users/sign_in"
    end
  end
end
