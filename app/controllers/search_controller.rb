class SearchController < ApplicationController
  def search
    if !params[:search].blank? && params[:search]
      str = params[:search]
      ext = str.match(/(.+?)\//)
      if ext.blank?
        search_params = str
        @items = Item.where("url like '%" + search_params + "%'").uniq
        render action: :search
      elsif ext[1] == "http:"
        search_params = str.match(/http:\/\/(.+?)\//)
        @items = Item.where("url like '%" + search_params[1] + "%'").uniq
        render action: :search
      elsif ext[1] == "https:"
        search_params = str.match(/https:\/\/(.+?)\//)
        @items = Item.where("url like '%" + search_params[1] + "%'").uniq
        render action: :search
      end
    else
      render action: :search
    end
  end
end
