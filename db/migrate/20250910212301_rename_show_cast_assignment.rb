class RenameShowCastAssignment < ActiveRecord::Migration[8.0]
  def change
    rename_table :show_person_role_assigments, :show_person_role_assignments
  end
end
