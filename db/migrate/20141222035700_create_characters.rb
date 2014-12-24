class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|

        t.string "name", null: false
        t.string "actor"
        t.text "description"
        t.integer "television_show_id", null: false

        t.timestamps

      end

      add_index "characters", ["name"], name: "index_characters_on_name", unique: true, using: :btree
  end
end
