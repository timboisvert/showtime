class DropCastMembers < ActiveRecord::Migration[8.0]
  def change
    drop_table :cast_members
  end
end
