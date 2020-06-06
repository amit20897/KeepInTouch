require_relative "../models/base_db_model"

class FriendsController < ApplicationController
    def get_friend_list
        db_connector = BaseDBModel.new()
        query = {}
        res = db_connector.find(:Users, query)
        render :json => res.to_json
    end

    def get_friend_by_username
        db_connector = BaseDBModel.new()

        user_name = params.require(:username)
        query = {'name' => user_name}
        res = db_connector.find(:Users, query)
	    render :json => res.to_json
    end

    def add_friend
        puts 33
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