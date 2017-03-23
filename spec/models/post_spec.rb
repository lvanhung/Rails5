require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validation' do
    let(:user) { FactoryGirl.build(:user) }
    let(:valid_post) { FactoryGirl.build(:post, user: user) }
    let(:unvalid_post) { FactoryGirl.build(:post, title: nil) }

    it 'it valid with atributes valid' do
      expect(valid_post).to be_valid
    end

    it 'it should unvalid with unvalid attributes' do
      expect(unvalid_post).to_not be_valid
    end

    it 'it not valid without a title' do
      post = Post.new(title: nil, user: user)
      expect(post).to_not be_valid
    end

    it 'it not valid without a content' do
      post = Post.new(content: nil, user: user)
      expect(post).to_not be_valid
    end

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(5) }
    it { should validate_length_of(:content).is_at_most(100) }
  end

  describe 'association' do
    it { should belong_to(:user) }
  end
end
