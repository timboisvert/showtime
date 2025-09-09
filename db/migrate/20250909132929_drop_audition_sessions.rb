class DropAuditionSessions < ActiveRecord::Migration[8.0]
  def change
    drop_table :audition_sessions
  end
end
