class CreateScoreEntry < ActiveRecord::Migration[5.1]
  def change
    create_table :score_entries do |t|
      t.references :player, foreign_key: true

      t.boolean :contributed, default: true
      t.boolean :out, default: false

      t.integer :bat_runs
      t.integer :balls_faced
      t.integer :six
      t.integer :four

      t.integer :overs
      t.integer :maidens
      t.integer :bowl_runs
      t.integer :wickets
      t.integer :catches
      t.integer :stumpings

      t.timestamps
    end
  end
end
