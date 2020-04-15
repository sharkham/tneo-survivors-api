class CreateBadgetypes < ActiveRecord::Migration[6.0]
  def change
    create_table :badgetypes do |t|
      t.string :name
      t.string :description
      t.string :emoji
      t.timestamps
    end
  end
end
