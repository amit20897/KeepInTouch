class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.string :user
      t.string :id
      t.string :priority
      t.string :last_met
      t.string :last_talked
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
