# == Schema Information
#
# Table name: bookmarks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  url         :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Bookmark < ActiveRecord::Base
end
