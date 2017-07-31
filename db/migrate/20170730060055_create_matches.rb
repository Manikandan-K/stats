class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :name
      t.references :team1
      t.references :team2

      t.timestamps
    end

    add_foreign_key :matches, :teams, column: :team1_id
    add_foreign_key :matches, :teams, column: :team2_id
  end
end
