require_relative "../models/base_db_model"
require_relative "../models/user.rb"
require_relative "../models/Friends_mapping.rb"

class FriendsController < ApplicationController
    # skip_before_filter :verify_authenticity_token  
    protect_from_forgery prepend: true
    @@id = nil

    def get_friends_list
        friends_mappings = FriendsMapping.get_friends_mappings('5edaa5f2ea613908a59465b7')
        p 'data_hash'
        data_hash = JSON.parse(friends_mappings)
        p data_hash
        list = []
        data_hash.each do |map|
            p map["friend_id"]
            list.append(map["friend_id"])
        end 
        render :json => list.to_json
    end

    def get_user_by_username
        user_name = params.require(:username)
        res = User.get_user_by_username(user_name)
	    render :json => res.to_json
    end

    def add_friend(friend_id, friend_name, priority)
        p friend_id
        User.add_friend(friend_id, friend_name)
        res = FriendsMapping.create(@@id, friend_id, priority)
        render :json => res.to_json
    end
    end
