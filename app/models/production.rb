class Production < ApplicationRecord
    has_many :shows, dependent: :destroy
    belongs_to :production_company
end
