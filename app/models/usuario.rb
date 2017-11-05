class Usuario < ApplicationRecord
  enum rol: [:cliente, :monitorista, :admin]
  validates :nombre, :username, :email, presence: true
end
