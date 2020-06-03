class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likers, through: :votes, source: :user
  has_many :votes
  has_many :tags
  has_many :categories, through: :tags
  has_one_attached :image, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: 'must be a valid image format' },
                    size: { less_than: 5.megabytes,
                            message: 'should be less than 5MB' }

  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 1500 }
end
