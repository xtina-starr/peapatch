require 'spec_helper'

describe Comment do
  let(:comment) { create(:comment) }
  describe 'validates' do
    it 'be valid' do
      expect(comment).to be_valid
    end
    it 'presence of user_id' do
      comment.update(user_id: nil)
      expect(comment.errors[:user_id]).to include "can't be blank"
    end
    it 'presence of post_id' do
      comment.update(post_id: nil)
      expect(comment.errors[:post_id]).to include "can't be blank"
    end
    it 'presence of content' do
      comment.update(content: nil)
      expect(comment.errors[:content]).to include "can't be blank"
    end
  end
end
