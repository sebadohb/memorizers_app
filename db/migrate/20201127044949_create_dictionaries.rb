class CreateDictionaries < ActiveRecord::Migration[6.0]
  def change
    create_table :dictionaries do |t|
      t.references :user,   foreign_key: true
      t.string  :word,            null: false
      t.string  :meaning,         null: false
      t.string  :definition,      null: false
      t.string  :pronunciation,   null: false
      t.integer :speech_id,       null: false
      t.integer :level_id,        null: false
      t.timestamps
    end
  end
end
