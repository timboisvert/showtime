class Audition < ApplicationRecord
  belongs_to :audition_session
  belongs_to :audition_request
end
