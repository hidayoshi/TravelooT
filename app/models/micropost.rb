# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  validates :description, presence: true
  mount_uploader :image, ImageUploader
end
