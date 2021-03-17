class CreateListFlags < ActiveRecord::Migration[6.0]
  def change
    create_table :list_flags do |t|
      t.references :list, null: false, foreign_key: true
      t.references :flag, null: false, foreign_key: true
      t.timestamps
    end
  end
end
