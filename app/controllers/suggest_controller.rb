require_relative "../models/base_db_model"
class SuggestController < ApplicationController
  def get
	  owner_id = params[:id]
	  db = BaseDBModel.new()
	  best_priority = BSON::Document.new({'priority': 999})
	  db.find(:FriendsMapping, {:owner_id => BSON::ObjectId(owner_id)}).each do |doc|
		  if doc['priority'] < best_priority['priority']
			  p doc['priority']
			  best_priority = doc
		  end
	  end
	  @suggestion=[best_priority.to_json]
  end
end
