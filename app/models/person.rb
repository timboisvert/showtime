class Person < ApplicationRecord
    has_one_attached :resume, dependent: :purge_later
    has_one_attached :headshot, dependent: :purge_later
    has_many :audition_requests, dependent: :destroy
end
