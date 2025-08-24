class CallToAudition < ApplicationRecord
  belongs_to :production
  has_many :audition_requests, dependent: :destroy
  has_many :questions, as: :questionable, dependent: :destroy

   def production_name
    self.production.name
  end
end
