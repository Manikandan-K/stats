ActiveAdmin.register ScoreEntry do
  permit_params :player_id, :contributed, :out, :bat_runs, :balls_faced, :overs, :maidens, :bowl_runs, :wickets, :catches, :stumpings

  after_create do |score_entry|
    p '*' * 100
    p 'in after create'
    p score_entry
    p '*' * 100

    stat = Stat.find_by(player_id: score_entry.player_id)
    stat.recalc(score_entry)
    stat.save!
  end

end
