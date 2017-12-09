require 'rails_helper'

RSpec.describe Admin::MonitoristasController, type: :controller do

  let(:valid_attributes) {
    {
      nombre: 'juan',
      username: 'juanito',
      email: 'juan@mass.com',
      password: 'secreto',
      telefono: '951 123 23 12'
    }
  }

  let(:invalid_attributes) {
    {
      nombre: nil,
      username: 'juanito',
      email: 'juanmass.com',
      password: 'secreto',
      telefono: '951 123 23 12'
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns all monitoristas as @monitoristas" do
      monitorista = FactoryBot.create :monitorista
      get :index
      expect(assigns(:monitoristas)).to eq([monitorista])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(assigns(:monitorista)).to_not be_persisted
    end
  end

  describe "GET #show" do
    it "assigns the requested monitorista as @monitorista" do
      @monitorista = FactoryBot.create :monitorista
      get :show, params: { id: @monitorista.id }, session: valid_session

      expect(assigns(:monitorista).id).to eq @monitorista.id
     end
  end # describe "GET #show"

  describe "GET #edit" do
    it "assigns the requested monitorista as @monitorista" do
      monitorista = Monitorista.create! valid_attributes
      get :edit, params: { id: monitorista.id }, session: valid_session
      expect(assigns(:monitorista)).to eq monitorista
    end
  end

  describe "POST #create" do
    context "parametros validos" do
      it "crea un nuevo Monitorista" do
        expect {
          post :create, params: { monitorista: valid_attributes }, session: valid_session
        }.to change(Monitorista, :count).by(1)
      end

      it "asigna una nueva instancia de Monitorista como @monitorista" do
        post :create, params: { monitorista: valid_attributes }, session: valid_session
        expect(assigns(:monitorista)).to be_a(Monitorista)
        expect(assigns(:monitorista)).to be_persisted
      end

      it "redirige a la lista de monitoristas" do
        post :create, params: { monitorista: valid_attributes }, session: valid_session
        expect(response).to redirect_to(admin_monitoristas_path)
      end
    end

    context "parametros invalidos" do
      it "no crea un nuevo Monitorista" do
        expect {
          post :create, params: { monitorista: invalid_attributes }, session: valid_session
        }.to change(Monitorista, :count).by(0)
      end

      it "no guarda una instancia de Monitorista como @monitorista" do
        post :create, params: { monitorista: invalid_attributes }, session: valid_session
        expect(assigns(:monitorista)).to be_a(Monitorista)
        expect(assigns(:monitorista)).to be_a_new(Monitorista)
      end

      it "redirige al template new" do
        post :create, params: { monitorista: invalid_attributes }, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      before :each do
        @monitorista = FactoryBot.create :monitorista
        put :update, params: { id: @monitorista.id,  monitorista: { nombre: 'nuevo nombre' } }, session: valid_session
      end

      it "must be update attributes of monitorista instance" do
        expect(@monitorista.reload.nombre).to eq 'nuevo nombre'
      end

      it "must be redirect to monitorista show view" do
        expect(response).to redirect_to admin_monitorista_path @monitorista
      end

      it "show a success message" do
        expect(flash[:notice]).to eq 'El monitorista se actualizo correctamente'
      end
    end # context with valid params

    context "with invalid params" do
      before :each do
        @monitorista = FactoryBot.create :monitorista, nombre: 'Ramon'
        put :update, params: { id: @monitorista.id,  monitorista: { nombre: '' } }, session: valid_session
      end

      it "must not be update monitorista instance" do
        expect(@monitorista.reload.nombre).to eq 'Ramon'
      end

      it "must be redirect to monitorista edit view" do
        expect(response).to render_template("edit")
      end
    end # context with invalid params
  end

  describe "POST #destroy" do
    before :each do
      @monitorista = FactoryBot.create :monitorista
      post :destroy, params: { id: @monitorista.id }, session: valid_session
    end

    it "delete monitorista" do
      expect(Monitorista.count).to eq 0
    end

    it "when delete monitorista render admin_monitoristas_path" do
      expect(response).to redirect_to admin_monitoristas_path
    end

    it "show success message" do
      expect(flash[:notice]).to eq 'El monitorista fue eliminado correctamente'
    end
  end

end
