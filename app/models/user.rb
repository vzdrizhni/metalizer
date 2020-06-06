class User < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy
  has_many :articles, foreign_key: :author_id, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :liked_articles, through: :votes, source: :article
  validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png],
                                     message: 'must be a valid image format' },
                     size: { less_than: 5.megabytes,
                             message: 'should be less than 5MB' },
                     presence: true
  validates :name, presence: true, length: { in: 3..50 }, uniqueness: true

  before_save { self.name = name.capitalize }
end
