class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.text :comment
      t.references :movies


      t.timestamps
    end
  end
end
