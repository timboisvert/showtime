class ChangeRoleAssignment < ActiveRecord::Migration[8.0]
  def change
    # remove_reference :show_person_role_assigments, :cast_role, foreign_key: false, index: true

    # if foreign_key_exists?(:show_person_role_assigments, column: :cast_role_id)
    #   remove_foreign_key :show_person_role_assigments, column: :cast_role_id
    # end

    add_reference :show_person_role_assigments, :role, null: false, foreign_key: true, index: true, if_not_exists: true
  end
end
