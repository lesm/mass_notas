FactoryBot.define do
  factory :usuario do
    nombre "Pedrito"
    username "pedrito"
    email "pedrito@gmail"
    telefono "951 123 23 23"
    empresa_id 1
    aceptar_terminos false
    notificar true
  end
end
