class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.references :team1, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
