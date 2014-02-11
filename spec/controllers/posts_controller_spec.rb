require 'spec_helper'
describe PostsController do 
  let(:user) { create(:user) }
  describe "GET new" do
    it "is successful" do 
      get :new
      expect(response).to be_successful
    end
  end
  describe "POST create" do 
    context "with valid attributes" do 
      let(:current_user) { create(:user) }
      before(:each) do
        controller.instance_variable_set(:@current_user, current_user)
      end
      let(:valid_attributes) { { title: 'Valid Title', datetime: DateTime.now, content: 'Valid Content', user_id: 1} }
      it "redirects" do 
        post :create, post: valid_attributes
        expect(response.status).to eq 302
      end

      it "increases the post count by 1" do 
        expect { post :create, post: valid_attributes }.to change(Post, :count).by(1)
      end

      it "increases the post count for the current user by 1" do 
        expect { post :create, post: valid_attributes }.to change(current_user.posts, :count).by(1)
      end
    end

    context "with invalid attributes" do 
      let(:invalid_attributes) { {title: '', content: '', datetime: ''} }
      let(:current_user) { create(:user) }
      before(:each) do
        controller.instance_variable_set(:@current_user, current_user)
      end
      it 'renders the new template' do 
        post :create, post: invalid_attributes 
        expect(response).to render_template :new
      end
      it 'does not increase the Post count' do 
        expect { post :create, post: invalid_attributes }.to change(Post, :count).by(0)
      end
    end

    context "without a current user" do
      let(:valid_attributes) { { title: 'Valid Title', datetime: DateTime.now, content: 'Valid Content', user_id: 1} } 
      
      it 'does not increase the Post count' do 
        expect{ post :create, post: valid_attributes }.to change(Post, :count).by(0)
      end

      it 'redirects to the new user template' do 
        post :create, post: valid_attributes
        expect(response).to redirect_to new_user_path
      end
    end
  end
end