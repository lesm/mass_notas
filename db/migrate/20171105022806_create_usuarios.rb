class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.string :telefono
      t.boolean :activo, default: true
      t.integer :rol
      t.integer :empresa_id
      t.boolean :aceptar_terminos, default: false
      t.boolean :notificar, default: true
      t.string :type

      t.timestamps
    end
  end
end
