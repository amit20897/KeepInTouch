

class User < BaseDBModel
  # @@_id = nil
  @@name = nil
  priorities = nil

  #user_name:string id:string priority:string last_met:datetime last_talked:datetime address:string phone:string email:string
  
  def initialize(name, priorities)
    super
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
    res = @find(:Users, query)
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
end
