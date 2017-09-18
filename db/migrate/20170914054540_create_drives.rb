class CreateDrives < ActiveRecord::Migration[5.1]
  def change
    create_table :drives do |t|
      t.string :start_time, null: false
      t.string :end_time
      t.string :result
      t.belongs_to :game, foreign_key: true, null: false
      t.string :possession, null: false
      t.integer :start_position, null: false
      t.integer :end_position

      t.timestamps
    end
  end
end
