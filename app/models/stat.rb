class Stat < ApplicationRecord
  belongs_to :player

  def recalc(score_entry)
    self.matches += 1
    self.innings += 1 if score_entry.batted
    self.not_outs += 1 unless score_entry.out

    bat_runs = with_default(score_entry, :bat_runs)
    self.bat_runs += bat_runs
    self.high_score = bat_runs if bat_runs > self.high_score
    self.balls_faced += with_default(score_entry, :balls_faced)
    self.bat_avg = (self.bat_runs.to_f / (self.innings - self.not_outs)).round(2) unless (self.innings - self.not_outs).zero?
    self.bat_strike_rate = ((self.bat_runs.to_f / self.balls_faced) * 100).round(2) unless self.balls_faced.zero?
    self.hundred += 1 if bat_runs >= 100
    self.fifty += 1 if bat_runs >= 50 && bat_runs < 100
    self.six += with_default(score_entry, :six)
    self.four += with_default(score_entry, :four)
    self.zero += 1 if score_entry.out && bat_runs.zero?

    self.overs = calc_overs(score_entry)
    self.maidens += with_default(score_entry, :maidens)
    self.bowl_runs += with_default(score_entry, :bowl_runs)
    self.wickets += with_default(score_entry, :wickets)
    best_bowling(score_entry)
    unless self.wickets.zero?
      self.bowl_avg = (self.bowl_runs.to_f / self.wickets).round(2)
      self.bowl_strike_rate = (to_balls(self.overs.to_f) / self.wickets).round(2)
    end
    self.economy = calc_economy.round(2) unless self.overs.zero?
    self.five_wickets += 1 if with_default(score_entry, :wickets) >= 5
    self.catches += with_default(score_entry, :catches)
    self.stumpings += with_default(score_entry, :stumpings)
  end

  def with_default(score_entry, key)
    value = score_entry.send(key)
    value.present? ? value : 0
  end

  def best_bowling(score_entry)
    wickets = with_default(score_entry, :wickets)
    runs = with_default(score_entry, :bowl_runs)

    if wickets > self.best_bowling_wicket
      self.best_bowling_wicket = wickets
      self.best_bowling_runs = runs
    elsif wickets == self.best_bowling_wicket && runs < self.best_bowling_runs
      self.best_bowling_runs = runs
    end
  end


  def calc_overs(score_entry)
    return self.overs if score_entry.overs.nil?
    balls = to_balls(self.overs) + to_balls(score_entry.overs)
    to_over(balls)
  end

  def calc_economy
    (self.bowl_runs.to_f / to_balls(self.overs)) * 6
  end

  def to_balls(over)
    over.to_i * 6 + (over * 10).to_i % 10
  end

  def to_over(balls)
    (balls / 6 ).to_i + (balls % 6).to_f / 10
  end

end