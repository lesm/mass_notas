class Usuario < ApplicationRecord
  before_create :set_rol

  enum rol: [:cliente, :monitorista, :admin]
  validates :nombre, :username, :email, presence: true
end
