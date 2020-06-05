require 'digest'



class SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def login
  end

  # def create
  # # @user = User.find_by(username: params[:username])
  # # if @user && @user.authenticate(params[:password])
  # #   sessions[:user_id] = @user.id
  # #   redirect_to '/welcome'
  # # else
  # #     redirect_to '/login'
  # # end
  # end

  def welcome
  end

  def page_requires_login
  end

  def get_token
    @user = User.find_by(username: params[:username])
    if @user
      puts  @user.to_json
      render :json => @user.to_json
    else
      @token = Digest::MD5.hexdigest(params[:username]).to_s

      user_hash = {
        :username => params.require(:username),
        :plain_pass => params.require(:plain_pass),
        :token => @token
      }
      @user = User.new(user_hash)
      puts "SAVED???"
      puts @user.save

      session[:user_id] = @user.id
      render :json => @user.to_json
    end
  end

end
