class BookmarksController < ApplicationController
  def index
  	@bookmarks = Bookmark.all
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    binding.pry

    agent = Mechanize.new
    scraping_url = @bookmark.url
    binding.pry
    page = agent.get(scraping_url)
    binding.pry
    elements = page.search('title')
    binding.pry
    @bookmark.title = elements
    binding.pry


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
