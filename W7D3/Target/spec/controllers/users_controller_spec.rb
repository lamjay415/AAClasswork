require 'rails_helper'

RSpec.describe "UsersController", type: :controller do
  describe "GET#show" do
    let!(:user) {FactoryBot.create(:user)}
    it "should render the show templete" do
       get :show, id: user.id
       expect(response).to render_templete(:show)
    end
  end
end
