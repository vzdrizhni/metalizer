class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:danger] = 'Bad name. Try again.'
      render 'new'
    end
  end

  def delete
    session.delete(:user_id)
    @current_user = nil
    redirect_to site_home_path
  end
end
