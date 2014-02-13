require 'spec_helper'
describe CommentsController do 
  describe 'GET new' do 
    it 'is successful' do 
      get :new
      expect(response).to be_successful
    end
  end
  
  describe 'POST create' do 
    before(:each) do
      request.env["HTTP_REFERER"] = "/"
    end
    context 'with valid attributes' do 
      let(:current_user) { create(:user) }
      let(:valid_post) { create(:post) }
      before(:each) do
        controller.instance_variable_set(:@current_user, current_user)
      end
      let(:valid_attributes) { { post_id: valid_post.id, content: 'Some valid content', datetime: DateTime.now } }
      
      it 'redirects' do
        post :create, comment: valid_attributes
        expect(response.status).to eq(302)
      end
      
      it "increases the comment count by 1" do 
        expect { post :create, comment: valid_attributes }.to change(Comment, :count).by(1)
      end

      it "increases the comment count for the current user by 1" do 
        expect { post :create, comment: valid_attributes }.to change(current_user.comments, :count).by(1)
      end
    end

    context "with invalid attributes" do 
      let(:invalid_attributes) { {post_id: '', content: '', datetime: ''} }
      let(:current_user) { create(:user) }
      before(:each) do
        controller.instance_variable_set(:@current_user, current_user)
      end

      it 'redirects' do 
        post :create, comment: invalid_attributes 
        expect(response.status).to eq(302)
      end
      it 'does not increase the Comment count' do 
        expect { post :create, comment: invalid_attributes }.to change(Comment, :count).by(0)
      end
    end

    context "without a current user" do
      let(:valid_attributes) { { post_id: 1, datetime: DateTime.now, content: 'Valid Content'} } 
      
      it 'does not increase the Comment count' do 
        expect{ post :create, comment: valid_attributes }.to change(Comment, :count).by(0)
      end

      it 'redirects to the root path' do 
        post :create, comment: valid_attributes
        expect(response).to redirect_to root_path
      end
    end
  end
end
