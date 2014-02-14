require 'spec_helper'

describe User do
  let(:user) { create(:user) }
  describe 'validates' do
    it 'is valid' do
      expect(user).to be_valid
    end
  

    it 'uid is present' do
      user.update(uid: nil)
      expect(user.errors[:uid]).to include("can't be blank")
    end

    it 'username is present' do
      user.update(username: nil)
      expect(user.errors[:username]).to include("can't be blank")
    end

    it 'provider is present' do
      user.update(provider: nil)
      expect(user.errors[:provider]).to include("can't be blank")
    end
  end

  describe 'create method' do
    it 'increases user count by 1' do
      first_num = User.all.count
      User.create(
                  uid: "1234567", 
                  username: "MrCool", 
                  provider: "Twitter", 
                  avatar_url: "thisisaurl.com", 
                  email: "us@us.com", 
                  access_token: "123456778999", 
                  access_token_secret: "123456778888"
                  )
      expect(User.all.count).to eq(first_num + 1)
    end
  end
end
