class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark = Bookmark.new(bookmark_params)

    @bookmark.list = @list
    @bookmark.movie = @movie

    if @bookmark.save
      redirect_to list_path(@list)
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
    params.require(:bookmark).permit(:comment)
  end
end
