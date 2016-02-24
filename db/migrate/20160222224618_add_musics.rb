class AddMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :song_title
      t.string :author
      t.string :url

      t.timestamps null: false
    end
  end
end
