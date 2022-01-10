# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    @user = User.where(email:params[:email]).first
    if user_signed_in? 
      redirect_to root_path
    else
      redirect_to new_user_session_path, info: "Sorry, we couldn't find an account with this username. Please check you're using the right username and try again."
    end
  end

  # DELETE /resource/sign_out
  #def destroy
    #super
   # redirect_to root_path
  #end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
