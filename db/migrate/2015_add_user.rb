class AddUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :upvote
      t.string :email
      t.string :password

      add_reference :musics, :users, index:true
      t.timestamps null: false
    end
  end
end