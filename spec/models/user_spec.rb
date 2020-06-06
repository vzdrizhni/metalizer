require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.new(name: 'Capos') }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:avatar) }
  end

  describe 'associations' do
    it { should have_many(:articles) }
    it { should have_many(:liked_articles).through(:votes) }
    it { should have_many(:votes) }
  end

end
