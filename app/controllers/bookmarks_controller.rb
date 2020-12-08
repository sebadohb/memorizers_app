class BookmarksController < ApplicationController

  def create
    bookmark = current_user.bookmarks.create(dictionary_id: params[:dictionary_id])
    redirect_back(fallback_location: root_path)
  end
  def destroy
    @dictionary = Dictionary.find(params[:dictionary_id])
    @bookmark = current_user.bookmarks.find_by(dictionary_id: @dictionary.id )
    @bookmark.destroy
    redirect_back(fallback_location: root_path)
  end
end
