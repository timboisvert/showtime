class ShowCastAssignment < ApplicationRecord
  belongs_to :show
  belongs_to :person
  belongs_to :cast_role
end
