class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :full_name
      t.string :password_digest
      t.string :location
      t.string :gender
      t.integer :age
      t.string :friends_list, array:true, default:[]
      t.string :preferences, array:true, default:[]
      t.string :online_status
      t.datetime :last_online

      t.timestamps
    end
  end
end
