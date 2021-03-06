require 'mongo'
class BaseDBModel

	@@client = nil

	def initialize()

		@@client = Mongo::Client.new('mongodb+srv://KeepingTouch2:NotmyName3@keepingtouch-cpcht.mongodb.net/KeepingTouch?retryWrites=true&w=majority')
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
end
