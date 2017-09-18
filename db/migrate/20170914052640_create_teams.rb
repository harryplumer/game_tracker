class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :abbrev, null: false

      t.timestamps
    end
  end
end
