class LoginsController < ApplicationController

  skip_before_action :require_login

  def new
    @user = User.new()
  end

  def create
    @user = User.new(email: params[:user][:email], password: params[:user][:password])

    if @user.registered?
      session[:login] = @user.id
      redirect_to todos_path
    else
      render 'new'
    end
  end

  def destroy
    session[:login] = nil
    redirect_to new_login_path
  end
end
