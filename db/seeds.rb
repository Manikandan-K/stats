# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?

  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  al = Team.create!(name: 'Ashok Leyland')
  tvs = Team.create!(name: 'TVS')
  Match.create!(date: Date.new, team1: al, team2: tvs)

  player = Player.create!(name: 'Karthick', team: al)

  Stat.create!(
      player: player,
      matches: 101,
      innings: 90,
      not_outs: 15,
      bat_runs: 2250,
      high_score: 126,
      bat_avg: 30,
      balls_faced: 2500,
      bat_strike_rate: 90,
      hundred: 3,
      fifty: 9,
      six: 26,
      four: 53,
      zero: 0,
      overs: 7.3,
      maidens: 1,
  )

end

AdminUser.create!(email: 'karthick@rkm.com', password: 'password', password_confirmation: 'password')