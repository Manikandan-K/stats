ActiveAdmin.register Stat do
  permit_params :player_id, :matches, :innings, :not_outs, :bat_runs, :high_score, :bat_avg, :balls_faced, :bat_strike_rate, :hundred, :fifty, :six, :four, :zero,
                :overs, :maidens, :bowl_runs, :wickets, :best_bowling_wicket, :best_bowling_runs, :bowl_avg, :economy, :bowl_strike_rate, :five_wickets, :catches, :stumpings

  class BowlingIndex < ActiveAdmin::Views::IndexAsTable
    def self.index_name
      "bowling"
    end
  end

  class BattingIndex < ActiveAdmin::Views::IndexAsTable
    def self.index_name
      "batting"
    end
  end

  index do
    selectable_column
    column :player
    actions
  end

  index as: BattingIndex do
    column :player
    column :matches
    column :innings
    column :not_outs
    column :bat_runs
    column :high_score
    column :bat_avg
    column :balls_faced
    column :bat_strike_rate
    column :hundred
    column :fifty
    column :six
    column :four
    column :zero
  end

  index  as: BowlingIndex do
    column :player
    column :matches
    column :overs
    column :maidens
    column :bowl_runs
    column :wickets
    column :best_bowling_wicket
    column :best_bowling_runs
    column :bowl_avg
    column :economy
    column :bowl_strike_rate
    column :five_wickets
    column :catches
    column :stumpings
  end
end
