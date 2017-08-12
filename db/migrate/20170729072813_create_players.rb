class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.references :team, foreign_key: true
      t.string :name

      t.timestamps
    end

    add_index :players, [:name, :team_id], unique: true
  end
end
