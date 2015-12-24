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
    page_title = agent.page.search("title").text
    page_og_image = agent.page.search("meta").xpath("//meta[@property='og:image']/@content")
    @bookmark.title = page_title
    @bookmark.og_image = page_og_image 

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
    params.require(:bookmark).permit(:title, :url, :description, :og_image)
  end
end
