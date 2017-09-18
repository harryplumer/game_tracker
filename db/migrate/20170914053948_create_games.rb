class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :home_team
      t.references :away_team
      t.string :stadium
      t.string :site

      t.timestamps
    end
  end
end
