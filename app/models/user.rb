class User < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy

  validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png],
                                     message: 'must be a valid image format' },
                     size: { less_than: 5.megabytes,
                             message: 'should be less than 5MB' },
                     presence: true
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true

  before_save { self.name = name.capitalize }
end
