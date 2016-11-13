class CreateKeihis < ActiveRecord::Migration
  def change
    create_table :keihis do |t|
      t.date :date
      t.references :kamoku_id, index: true, foreign_key: true
      t.string :tekiyou
      t.integer :kingaku

      t.timestamps null: false
    end
  end
end
