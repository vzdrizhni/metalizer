class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_one_attached :image, dependent: :destroy

  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                     message: 'must be a valid image format' },
            size: { less_than: 5.megabytes,
                    message: 'should be less than 5MB' }

  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 1500 }
end
