require 'rails_helper'

RSpec.describe Usuario, type: :model do
  it { should validate_presence_of :nombre }
  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should define_enum_for(:rol).with([:cliente, :monitorista, :admin]) }
end
