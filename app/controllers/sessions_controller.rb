class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.where(username: params[:session][:username]).first

    if user && user.authenticate(params[:session][:password])
      reset_session
      session[:user_id] = user.id
      redirect_to root_url, notice: "Добро пожаловать #{user.firstname}"
    else
      flash.now.alert = "Ошибка аутентификации, проверьте имя пользователя и/или пароль"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
