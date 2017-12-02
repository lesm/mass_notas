require 'rails_helper'

RSpec.describe Monitorista, type: :model do
  describe "#rol" do
    it "Must be has a 'monitorista' role after create" do
      monitorista = FactoryBot.create :monitorista, rol: :admin
      expect(monitorista).to be_monitorista
    end
  end
end
