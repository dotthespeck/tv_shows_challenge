class ChangeCharacterTable < ActiveRecord::Migration
  def change
    change_column_null :characters, :television_show_id, false
  end
end
