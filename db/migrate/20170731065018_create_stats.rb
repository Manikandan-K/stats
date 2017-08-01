class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.references :player, foreign_key: true

      t.integer :matches
      t.integer :innings
      t.integer :not_outs

      t.integer :bat_runs
      t.integer :high_score
      t.decimal :bat_avg, precision: 5, scale: 2
      t.integer :balls_faced
      t.decimal :bat_strike_rate, precision: 5, scale: 2
      t.integer :hundred
      t.integer :fifty
      t.integer :six
      t.integer :four
      t.integer :zero

      t.integer :overs
      t.integer :maidens
      t.integer :bowl_runs
      t.integer :wickets
      t.integer :best_bowling_wicket
      t.integer :best_bowling_runs
      t.decimal :bowl_avg, precision: 5, scale: 2
      t.decimal :economy, precision: 5, scale: 2
      t.decimal :bowl_strike_rate, precision: 5, scale: 2
      t.integer :five_wickets
      t.integer :catches
      t.integer :stumpings

      t.timestamps
    end
  end
end
