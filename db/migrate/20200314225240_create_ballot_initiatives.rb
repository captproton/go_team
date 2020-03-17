class CreateBallotInitiatives < ActiveRecord::Migration[6.0]
  def change
    create_table :ballot_initiatives do |t|
      t.string :name
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
