class CreateListFlags < ActiveRecord::Migration[6.0]
  def change
    create_table :list_flags do |t|

      t.timestamps
    end
  end
end
