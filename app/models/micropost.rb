# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :description, presence: true
  mount_uploader :image, ImageUploader
end
