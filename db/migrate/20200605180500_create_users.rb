class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :plain_pass
      t.string :token
      t.string :id

      t.timestamps


    end
  end
end
