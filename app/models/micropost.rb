class Micropost < ApplicationRecord
    validates :description, presence: true
end
