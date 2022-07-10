class Hospital < ApplicationRecord
    has_many :doctors
    scope :sorted_by_created_at, -> { order(created_at: :desc) }
end

