require 'mongo'


class User 
  @@client = nil
  @@_id = nil
  @@name = nil
  priorities = nil

  #user_name:string id:string priority:string last_met:datetime last_talked:datetime address:string phone:string email:string
  
  def initialize(name, priorities)
    @@client = Mongo::Client.new('mongodb+srv://KeepingTouch2:NotmyName3@keepingtouch-cpcht.mongodb.net/KeepingTouch?retryWrites=true&w=majority')
    # @_id = _id
    @name = @name
    @priorities = @priorities
  end
  
  def self.get_friend(user_name)
    query = {'name' => user_name}
    res = self.find_one(:Users, query)
    return res.to_json
  end

  def self.get_friends_list()
    query = {}
    res = self.find(:Users, query)
    return res.to_json
  end

  def self.add_friend(friend_id, friend_name)
    doc = {
      # '_id' => _id,
      'name' => name,
      'priorities' => {}
    }
    FriendsMapping.create()
    self.create(:Users, doc)
  end

  def finalize(object_id)
		@@client.close
	end

	def find(collection, filter)
		collection = @@client[collection]
		return collection.find(filter)
	end

	def find_one(collection, filter)
		collection = @@client[collection]
		return collection.find(filter).first
	end

	def create(collection, document)
		collection = @@client[collection]
		collection.insert_one(document)
	end

	def delete(collection, filter)
		collection = @@client[collection]
		result = collection.delete_may(filter)
		return result.deleted_count
	end

	def update(collection, filter, changes)
		collection = @@client[collection]
		result = collection.update_one( filter, { '$set' => changes } )
		p result.modified_count
	end
end

