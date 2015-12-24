class AddOgImageToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :og_image, :string
  end
end
