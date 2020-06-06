class FriendsMapping < BaseDBModel
    @@_id = nil
    @@friend_id = nil
    @@owner_id = nil
    @@priority = nil
  
  
    #user_name:string id:string priority:string last_met:datetime last_talked:datetime address:string phone:string email:string
    
    def initialize(id, friend_id, owner_id, priority)
      super
      @friend_id = @friend_id
      @priorities = @priorities
    end
    
    def self.get_friends_mappings(owner_id)
      query = {'owner_id' => owner_id}
      res = self.find(:Users, query)
      return res.to_json
  
    def self.create(owner_id, friend_id, priority)
      doc = {
          'owner_id' => owner_id,
          'friend_id' => friend_id,
          'priority' => priority
      }
      res = super(:FriendsMapping, doc)
      return res.to_json
    end
  