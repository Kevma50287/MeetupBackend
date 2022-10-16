class CreateUsersInChats < ActiveRecord::Migration[7.0]
  def change
    create_table :users_in_chats do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
