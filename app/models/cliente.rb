class Cliente < Usuario

  private

  def set_rol
    self.rol = "cliente"
  end
end
