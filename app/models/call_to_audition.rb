class CallToAudition < ApplicationRecord
  belongs_to :production

   def production_name
    self.production.name
  end
end
