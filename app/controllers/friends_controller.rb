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
