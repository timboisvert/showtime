class Person < ApplicationRecord
    has_one_attached :resume
    has_one_attached :headshot
end
