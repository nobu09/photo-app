class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    error_message = []
    error_message << 'ユーザーIDを入力してください' if session_params[:login].blank?
    error_message << 'パスワードを入力してください' if session_params[:password].blank?
    if error_message.present?
      flash.now[:danger] = error_message
      render :new and return
    end

    user = User.find_by(login: session_params[:login])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to photos_path, notice: 'ログインしました'
    else
      flash.now[:danger] = ['入力されたユーザーIDとパスワードに一致するユーザーが存在しません']
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトしました'
  end

  private

  def session_params
    params.require(:session).permit(:login, :password)
  end
end
