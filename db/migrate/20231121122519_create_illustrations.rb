class CreateIllustrations < ActiveRecord::Migration[7.0]
  def change
    create_table :illustrations do |t|
      t.references :character, null: false, foreign_key: true
      t.text :situation

      t.timestamps
    end
  end
end
