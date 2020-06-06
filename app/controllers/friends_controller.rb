require_relative "../models/base_db_model"
require_relative "../models/user.rb"
require_relative "../models/Friends_mapping.rb"

class FriendsController < ApplicationController

    def get_friends_list
        friends_mappings = FriendsMapping.get_friends_mappings('5edaa5f2ea613908a59465b7')
        p 'friends_mappings'
        p friends_mappings
        friends_mappings.each do |map|
            p map.friend_id
        end 
        res = User.get_users_list()
        render :json => res.to_json
    end

    def get_user_by_username
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
