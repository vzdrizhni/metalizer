class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likers, through: :votes, source: :user
  has_many :votes, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: 'must be a valid image format' },
                    size: { less_than: 5.megabytes,
                            message: 'should be less than 5MB' },
                    presence: true
  validates :title, presence: true, length: { in: 3..50 }, uniqueness: true
  validates :text, presence: true, length: { in: 30..1500 }
  validates :categories, presence: true
end
