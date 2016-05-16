class SessionsController < ApplicationController
  skip_before_action :require_login, except: [ :destroy ]

  layout 'card'

  # GET /login
  def new
  end

  # POST /sessions/create
  def create
    if @user = login(user_params[:email], user_params[:password])
      redirect_back_or_to root_url
    else
      redirect_to login_url, flash: { error: "<i class='ss-icon icon-adjust'>disapprove</i> We couldn't log you in with those credentials. Try again?" }
    end
  end

  # GET /logout
  def destroy
    logout

    redirect_to root_url(subdomain: nil)
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
