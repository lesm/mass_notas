class ChangeAttributesNameOfUsuario < ActiveRecord::Migration[5.1]
  def change
    rename_column :usuarios, :encrypted_password, :password_digest
  end
end
