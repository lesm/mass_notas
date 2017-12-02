require 'rails_helper'

RSpec.describe Cliente, type: :model do
  describe "#rol" do
    it "Must be has a 'cliente' rol after create" do
      cliente = FactoryBot.create :cliente, rol: :admin
      expect(cliente).to be_cliente
    end
  end
end
