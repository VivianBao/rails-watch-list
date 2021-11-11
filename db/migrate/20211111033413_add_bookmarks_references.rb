class AddBookmarksReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookmarks, :movie, foreign_key: true
    add_reference :bookmarks, :list, foreign_key: true
  end
end
