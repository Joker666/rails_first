class AccessController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in, :except => [:login, :logout, :attempt_login]

  def index
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = 'You are logged in'
      redirect_to(:action => 'index')
    else
      flash[:notice] = 'Invalid Username/Password!'
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = 'You are logged out'
    redirect_to(:action => 'login')
  end

end
