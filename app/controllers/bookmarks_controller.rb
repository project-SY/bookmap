class BookmarksController < ApplicationController
  def index
  	@bookmarks = Bookmark.all
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to  root_path, notice: 'bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:title, :url, :description)
  end
end
