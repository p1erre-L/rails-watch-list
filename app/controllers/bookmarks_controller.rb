class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    @movie = Movie.find(params[:bookmark][:movie_id])

    @bookmark.movie = @movie
    @bookmark.list = List.find(params[:list_id])

    if @bookmark.save
      redirect_to list_path(params[:list_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    list_id = @bookmark.list_id
    @bookmark.destroy
    redirect_to list_path(list_id), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
