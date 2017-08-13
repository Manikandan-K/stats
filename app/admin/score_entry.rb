ActiveAdmin.register ScoreEntry do
  permit_params :player_id, :match_id, :batted, :out, :bat_runs, :balls_faced, :six, :four, :overs, :maidens, :bowl_runs, :wickets, :catches, :stumpings

  after_create do |score_entry|
    stat = Stat.find_by(player_id: score_entry.player_id)
    stat = Stat.new(player: score_entry.player) if stat.nil?
    stat.recalc(score_entry)
    stat.save!
  end

end
