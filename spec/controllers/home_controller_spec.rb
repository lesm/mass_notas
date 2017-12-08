require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      allow_any_instance_of(ApplicationController).to receive(:usuario_actual).and_return(FactoryBot.create :monitorista)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "When curret_user doesn't exist" do
    it "should redirect to login path" do
      get :index
      expect(response).to redirect_to login_path
    end
  end # describe "should redirect to login path if no current_user exist"

end
