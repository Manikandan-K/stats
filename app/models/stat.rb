class Stat < ApplicationRecord
  belongs_to :player

  def recalc(score_entry)
    self.matches += 1
    self.innings += 1 if score_entry.contributed
    self.not_outs += 1 unless score_entry.out

    bat_runs = score_entry.bat_runs.nil? ? 0 : score_entry.bat_runs
    self.bat_runs += bat_runs
    self.high_score = bat_runs if bat_runs > self.high_score
    self.balls_faced += (score_entry.balls_faced.nil? ? 0 : score_entry.balls_faced)
    self.bat_avg = self.bat_runs / ( self.innings - self.not_outs)
    self.bat_strike_rate = (self.bat_runs / self.balls_faced) * 100
    self.hundred += 1 if bat_runs >= 100
    self.fifty += 1 if bat_runs >= 50 && bat_runs < 100
    self.six += (score_entry.six.nil? ? 0 : score_entry.six)
    self.four += (score_entry.four.nil? ? 0 : score_entry.four)
    self.zero += 1 if score_entry.out && bat_runs.zero?

    self.overs += score_entry.overs
  end

end