class CreateUserLevels < ActiveRecord::Migration[7.1]
  def change
    create_table :user_levels do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :level
      t.integer :points

      t.timestamps
    end
  end
end
