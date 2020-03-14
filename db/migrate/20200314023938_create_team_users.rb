class CreateTeamUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :team_users do |t|
      t.references :team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
