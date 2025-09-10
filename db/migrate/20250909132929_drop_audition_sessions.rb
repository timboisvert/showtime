class DropAuditionSessions < ActiveRecord::Migration[8.0]
  def change
    if table_exists?(:auditions)
      drop_table :auditions
    end
    if table_exists?(:audition_sessions)
      drop_table :audition_sessions
    end
  end
end
