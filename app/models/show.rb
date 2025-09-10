class Show < ApplicationRecord
    belongs_to :production

    has_many :show_person_role_assignments, dependent: :destroy
    has_many :people, through: :show_person_role_assignments
    has_many :roles, through: :show_person_role_assignments

    def display_name
      "#{production.name} - #{secondary_name} - #{date_and_time.strftime("%-m/%-d/%Y")}"
    end
end
