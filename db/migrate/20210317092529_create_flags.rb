class CreateFlags < ActiveRecord::Migration[6.0]
  def change
    create_table :flags do |t|
      t.string :status, null: false
      t.datetime :date, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
