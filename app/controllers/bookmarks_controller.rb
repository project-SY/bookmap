class BookmarksController < ApplicationController
  def index
  	@bookmarks = Bookmark.order(created_at: :desc)
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    require "mechanize"
    agent = Mechanize.new
    scraping_url = @bookmark.url
    page = agent.get(scraping_url)
    elements = agent.page.search("title").text
    @bookmark.title = elements

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

  private
  def bookmark_params
    params.require(:bookmark).permit(:title, :url, :description)
  end
end
