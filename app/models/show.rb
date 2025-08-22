class Show < ApplicationRecord
    belongs_to :production

    def display_name
      "#{production.name} - #{secondary_name} - #{date_and_time.strftime("%-m/%-d/%Y")}"
    end
end
