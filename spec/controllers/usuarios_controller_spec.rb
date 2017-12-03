require 'rails_helper'

RSpec.describe UsuariosController, type: :controller do

  describe "GET #login" do
    it "should render the login form" do
      get :login
      expect(response).to render_template('login')
    end
  end

  describe "#POST authenticate" do
    context "unsuccessful authentication" do
      it "should render 'login' template if authentication fails" do
        Monitorista.create nombre: 'pedro', username: 'pedrito', email: 'pedrito@gmail.com', password: '1qaz2wsx'
        post :authenticate, params: { usuario: { username: 'pedrito', password: '1qaz2ws' } }
        expect(response).to render_template('login')
      end
      it "should show error message" do
        Monitorista.create nombre: 'pedro', username: 'pedrito', email: 'pedrito@gmail.com', password: '1qaz2wsx'
        post :authenticate, params: { usuario: { username: 'pedrito', password: '1qaz2ws' } }
        expect(flash[:error]).to eq 'Usuario o contraseña no válidos'
      end
    end # context unsuccessful authentication

    context "successful authentication" do
      it "Should authentication successful" do
        Monitorista.create nombre: 'pedro', username: 'pedrito', email: 'pedrito@gmail.com', password: 'secreto'
        post :authenticate, params: { usuario: { username: 'pedrito', password: 'secreto' } }
        expect(response).to redirect_to root_path
      end

      it "Should store user data in session" do
        monitorista = Monitorista.create nombre: 'pedro', username: 'pedrito', email: 'pedrito@gmail.com', password: 'secreto'
        post :authenticate, params: { usuario: { username: 'pedrito', password: 'secreto' } }
        expect(session[:usuario_id]).to eq monitorista.id
      end
    end # context successful authentication
  end # describe "should render 'login' template if authentication fails"

end
