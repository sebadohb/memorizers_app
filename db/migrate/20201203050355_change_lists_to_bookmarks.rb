class ChangeListsToBookmarks < ActiveRecord::Migration[6.0]
  def change
    rename_table :lists, :bookmarks
  end
end
