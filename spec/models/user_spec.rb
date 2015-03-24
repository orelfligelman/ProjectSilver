require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "administrator access" do
    before :each do
      user = create(:admin)
      session[:user_id] = user.id
    end
  end
  describe "regular guest access" do
    before :each do
      user = create(:guest)
      session[:user_id] = user.id
    end
    describe "Post#create" do
      it "requires login" do
      post :create, id: create(:something)
        something: attributes_for(:something)
        expect(response).to redirect_to login_url
    end
  end
  describe "loggedin user access" do
    before :each do
      user = create(:user)
      session[:user_id] = user.id
    end
  end
end
