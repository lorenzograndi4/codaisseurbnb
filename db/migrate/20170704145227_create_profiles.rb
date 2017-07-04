class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :link
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
