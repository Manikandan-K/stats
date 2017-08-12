class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.date :date
      t.references :team1
      t.references :team2

      t.timestamps
    end

    add_foreign_key :matches, :teams, column: :team1_id
    add_foreign_key :matches, :teams, column: :team2_id
    add_index :matches, [:date, :team1_id, :team2_id], unique: true
  end
end
