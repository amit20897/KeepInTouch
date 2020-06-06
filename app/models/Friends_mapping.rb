require 'mongo'


class FriendsMapping < BaseDBModel
    @@_id = nil
    @@friend_id = nil
    @@owner_id = nil
    @@priority = nil
    @@client = Mongo::Client.new('mongodb+srv://KeepingTouch2:NotmyName3@keepingtouch-cpcht.mongodb.net/KeepingTouch?retryWrites=true&w=majority')


  #user_name:string id:string priority:string last_met:datetime last_talked:datetime address:string phone:string email:string
  
    def initialize(id, friend_id, owner_id, priority)
        @friend_id = @friend_id
        @priorities = @priorities
      end
      
    def self.get_friends_mappings(owner_id)
        owner_id_obj = "ObjectId(%s)" % [owner_id]
        query = "{'owner_id': {'_id':  %s}}" % [owner_id_obj]
        p query
        res = self.find(:Users, query).sort({ "priority": 1 })
        return res.to_json
    end 
    
    def self.create(owner_id, friend_id, priority)
        doc = {
            'owner_id' => owner_id,
            'friend_id' => friend_id,
            'priority' => priority
        }
        res = super(:FriendsMapping, doc)
        return res.to_json
    end

    def self.finalize(object_id)
		@@client.close
	end

	def self.find(collection, filter)
		collection = @@client[collection]
		return collection.find(filter)
	end

	def self.find_one(collection, filter)
		collection = @@client[collection]
		return collection.find(filter).first
	end

	def self.create(collection, document)
		collection = @@client[collection]
		collection.insert_one(document)
	end

	def self.delete(collection, filter)
		collection = @@client[collection]
		result = collection.delete_may(filter)
		return result.deleted_count
	end

	def self.update(collection, filter, changes)
		collection = @@client[collection]
		result = collection.update_one( filter, { '$set' => changes } )
		p result.modified_count
	end
end