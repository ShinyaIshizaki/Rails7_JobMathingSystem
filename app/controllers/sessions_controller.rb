class SessionsController < ApplicationController
  def new
  end

  def create
    # メールアドレスをすべて小文字で判定
    user = User.find_by(email: params[:session][:email].downcase)

    # 入力されたメールアドレスを持つユーザーがデータベースに存在し、かつ入力されたパスワードがそのユーザーのパスワードである場合
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    # ログイン中の場合のみログアウトする
    log_out if logged_in?
    redirect_to root_url
  end
end
