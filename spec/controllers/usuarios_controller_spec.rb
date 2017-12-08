require 'rails_helper'

RSpec.describe UsuariosController, type: :controller do

  describe "GET #login" do
    it "should render the login form" do
      get :login
      expect(response).to render_template('login')
    end
  end

  describe "POST #authenticate" do
    context "unsuccessful authentication" do
      before :each do
        Monitorista.create nombre: 'pedro', username: 'pedrito', email: 'pedrito@gmail.com', password: '1qaz2wsx'
        post :authenticate, params: { usuario: { username: 'pedrito', password: '1qaz2ws' } }
      end

      it "should render 'login' template if authentication fails" do
        expect(response).to redirect_to('/login')
      end

      it "should show error message" do
        expect(flash[:error]).to eq 'Usuario o contraseña no válidos'
      end
    end # context unsuccessful authentication

    context "successful authentication" do
      before :each do
        Monitorista.create nombre: 'pedro', username: 'pedrito', email: 'pedrito@gmail.com', password: 'secreto'
        post :authenticate, params: { usuario: { username: 'pedrito', password: 'secreto' } }
      end

      it "Should authentication successful" do
        expect(response).to redirect_to root_path
      end

      it "Should store user data in session" do
        expect(session[:usuario_id]).to eq Monitorista.first.id
      end
    end # context successful authentication
  end # describe "should render 'login' template if authentication fails"

  describe "GET #logout" do
    before :each do
      @monitorista = FactoryBot.create(:monitorista)
      post :authenticate, params: { usuario: { username: @monitorista.username, password: @monitorista.password } }
      delete :logout
    end

    it "success logout" do
      expect(session[:usuario_id]).to be_nil
    end

    it "should redirect to login_path when usuario log out" do
      expect(response).to redirect_to login_path
    end
  end

end
