class Match < ApplicationRecord
  belongs_to :team1, class_name: 'Team'
  belongs_to :team2, class_name: 'Team'
  has_many :score_entries


  def display_name
    "#{date} : #{team1.name} vs #{team2.name}"
  end

end