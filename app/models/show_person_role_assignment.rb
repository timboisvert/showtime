class ShowPersonRoleAssignment < ApplicationRecord
  belongs_to :show
  belongs_to :person
  belongs_to :role
end
