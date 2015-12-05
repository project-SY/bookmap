class BookmarksController < ApplicationController
  def index
  	@bookmarks = Bookmark.all
  	@bookmark = Bookmark.new()
  end

  def cre
  	
  end
end
