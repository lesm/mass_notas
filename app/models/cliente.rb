class Cliente < Usuario
  before_create :set_rol

  private

  def set_rol
    self.rol = "cliente"
  end
end
