class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :description
      t.string :emoji

      t.belongs_to :novel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
