class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.references :player, foreign_key: true

      t.integer :matches, default: 0
      t.integer :innings, default: 0
      t.integer :not_outs, default: 0

      t.integer :bat_runs, default: 0
      t.integer :high_score, default: 0
      t.decimal :bat_avg, precision: 5, scale: 2, default: 0
      t.integer :balls_faced, default: 0
      t.decimal :bat_strike_rate, precision: 5, scale: 2, default: 0
      t.integer :hundred, default: 0
      t.integer :fifty, default: 0
      t.integer :six, default: 0
      t.integer :four, default: 0
      t.integer :zero, default: 0

      t.decimal :overs, precision: 5, scale: 2, default: 0
      t.integer :maidens, default: 0
      t.integer :bowl_runs, default: 0
      t.integer :wickets, default: 0
      t.integer :best_bowling_wicket, default: 0
      t.integer :best_bowling_runs, default: 0
      t.decimal :bowl_avg, precision: 5, scale: 2, default: 0
      t.decimal :economy, precision: 5, scale: 2
      t.decimal :bowl_strike_rate, precision: 5, scale: 2
      t.integer :five_wickets, default: 0
      t.integer :catches, default: 0
      t.integer :stumpings, default: 0

      t.timestamps
    end
  end
end
