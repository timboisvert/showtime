class Audition < ApplicationRecord
  belongs_to :person
  belongs_to :audition_request

  has_and_belongs_to_many :audition_sessions
end
