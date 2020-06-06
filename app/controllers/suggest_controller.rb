require_relative "../models/base_db_model"
class SuggestController < ApplicationController
  def get
	  owner_id = params[:id]
	  db = BaseDBModel.new()
	  best_priority = Array.new(5, BSON::Document.new({'priority': 999, '_id':'0'}))
	  i = 0
	  db.find(:FriendsMapping, {:owner_id => BSON::ObjectId(params[:id])}).each do |doc|
		  p doc
		  while i < best_priority.length()
			  if doc['priority'] < best_priority[i]['priority'] 
				  break if best_priority.include? doc
				  best_priority[i] = doc
			  end
			  i = i + 1
		  end
	  end
	  i = 0
	  while i < best_priority.length()
		  best_priority[i] = db.find_one(:Users, {:_id => best_priority[i]['friend_id']})
		  i = i + 1
	  end
	  render :json => best_priority.compact
  end
end
