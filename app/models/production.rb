class Production < ApplicationRecord
    has_many :shows, dependent: :destroy
    has_many :call_to_auditions, dependent: :destroy
    has_many :audition_requests, through: :call_to_auditions
    belongs_to :production_company
end
