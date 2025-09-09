class Production < ApplicationRecord
    has_many :shows, dependent: :destroy
    has_many :call_to_auditions, dependent: :destroy
    has_many :audition_sessions, dependent: :destroy
    belongs_to :production_company
end
