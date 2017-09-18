class CreatePlays < ActiveRecord::Migration[5.1]
  def change
    create_table :plays do |t|
      t.integer :down, null: false
      t.integer :distance, null: false
      t.integer :yards_gained
      t.string :play_type, null: false
      t.references :passer
      t.references :receiver
      t.references :rusher
      t.references :tackler
      t.references :intercepted
      t.references :fumble_forced
      t.references :fumble_recovery
      t.integer :turned_over_at
      t.integer :recovered_at
      t.integer :return_distance

      t.timestamps
    end
  end
end
