class CreateNovels < ActiveRecord::Migration[6.0]
  def change
    create_table :novels do |t|
      t.string :title
      t.text :summary
      t.string :plan
      t.integer :goal
      t.integer :wordcount

      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
