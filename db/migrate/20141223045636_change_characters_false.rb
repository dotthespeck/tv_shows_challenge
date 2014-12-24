class ChangeCharactersFalse < ActiveRecord::Migration
  def change
    change_column_null :characters, :television_show_id, true
  end
end
