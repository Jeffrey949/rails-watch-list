class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = params[:list_id]
    @bookmark.save
    redirect_to list_path(@bookmark.list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:list_id])
    @bookmark.destroy
    redirect_to list_bookmark_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
