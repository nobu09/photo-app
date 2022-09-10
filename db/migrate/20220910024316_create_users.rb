class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login, null: false, comment: 'ユーザーID'
      t.string :password_digest, null: false, comment: 'パスワード'

      t.timestamps
      t.index :login, unique: true
    end
  end
end
