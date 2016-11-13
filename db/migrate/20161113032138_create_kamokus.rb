class CreateKamokus < ActiveRecord::Migration
  def change
    create_table :kamokus do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
