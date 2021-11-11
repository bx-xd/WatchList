class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to lists_path
    else
      render 'new'
    end
  end

  def destroy
    @bookmark = Bookmark.find(bookmark_params)
    if @bookmark.delete
      redirect_to lists_path
    else
      redirect_to list_path(@bookmark.list)
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end
end
