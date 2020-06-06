require 'rails_helper'

RSpec.describe Article, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:categories) }
    it { should validate_presence_of(:image) }
  end

  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:likers).through(:votes) }
    it { should have_many(:votes) }
    it { should have_many(:tags) }
    it { should have_many(:categories).through(:tags) }
  end

end
