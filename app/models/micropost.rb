# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }
  validates :description, presence: true
  mount_uploader :image, ImageUploader

  def like?(user)
    liked_users.include?(user)
  end

  def like(user, micropost_id)
    Like.create(user_id: user.id, micropost_id: micropost_id)
  end

  def unlike(user, micropost_id)
    Like.find_by(user_id: user.id, micropost_id: micropost_id).destroy
  end
end
