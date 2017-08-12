ActiveAdmin.register Match do
  permit_params :match, :team1_id, :team2_id
end
