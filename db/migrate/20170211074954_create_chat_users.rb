class CreateChatUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_users do |t|
      t.integer :user_id, foreign_key: true
      t.integer :group_id, foreign_key: true

      t.timestamps
    end
  end
end
