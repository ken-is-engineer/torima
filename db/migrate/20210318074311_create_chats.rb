class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :message, null: false
      t.references :user, forreign_key: true
      t.references :flag, forreign_key: true
      t.timestamps
    end
  end
end
