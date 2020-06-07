require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:categories) }
    it { should validate_presence_of(:image) }
    it { should validate_length_of(:title).is_at_least(3) }
    it { should validate_length_of(:text).is_at_least(30).is_at_most(1500) }
    it { should validate_uniqueness_of(:title) }
  end

  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:likers).through(:votes) }
    it { should have_many(:votes) }
    it { should have_many(:tags) }
    it { should have_many(:categories).through(:tags) }
  end
end
