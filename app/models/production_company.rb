class ProductionCompany < ApplicationRecord
    has_many :productions, dependent: :destroy
end
