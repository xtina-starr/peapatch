require 'spec_helper'

describe Post do
  let(:post) { create(:post) }
  describe 'validates' do
    it 'is valid' do
      expect(post).to be_valid
    end
    it 'user_id presence' do
      post.update(user_id: nil)
      expect(post.errors[:user_id]).to include "can't be blank"
    end
    it 'title presence' do
      post.update(title: nil)
      expect(post.errors[:title]).to include "can't be blank"
    end
    it 'content presence' do
      post.update(content: nil)
      expect(post.errors[:content]).to include "can't be blank"
    end
    it 'datetime presence' do
      post.update(datetime: nil)
      expect(post.errors[:datetime]).to include "can't be blank"
    end
  end
end
