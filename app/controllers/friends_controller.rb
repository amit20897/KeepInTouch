require_relative "../models/base_db_model"
require_relative "../models/user.rb"

class FriendsController < ApplicationController

    def get_friend_list
        res = User.get_friend_list()
        render :json => res.to_json
    end

    def get_friend_by_username
        user_name = params.require(:username)
        res = User.get_friend(user_name)
	    render :json => res.to_json
    end

    def add_friend(friend_id, friend_name, priority)
        User.add_friend(friend_id, friend_name)
        res = FriendsMapping.create(@@id, friend_id, priority)
        render :json => res.to_json
    end
    end








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