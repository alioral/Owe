class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user] = user #store to object itself
    redirect_to root_url
  end

  def destroy
    session[:user] = nil
    redirect_to root_url
  end
end