class BookmarksController < ApplicationController
  def index
  	@bookmarks = Bookmark.all
  end

  def new
  	@bookmark = Bookmark.new
  end

  def cre
  	
  end
end
