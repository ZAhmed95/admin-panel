class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email, null: false
      t.text :password_digest, null: false
    end
  end
end
