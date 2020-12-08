class AddIndexUserIdAndDictionaryIdToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_index :bookmarks, [:user_id, :dictionary_id], :unique => true
  end
end
