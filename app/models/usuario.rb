class Usuario < ApplicationRecord
  has_secure_password
  before_create :set_rol

  enum rol: [:cliente, :monitorista, :admin]
  validates :nombre, :username, :email, :password_digest,
    presence: true
end
