# == Schema Information
# Schema version: 20131110221209
#
# Table name: images
#
#  id         :integer          not null, primary key
#  token      :string(255)      indexed
#  data_uri   :text
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_images_on_token  (token) UNIQUE
#

class Image < ActiveRecord::Base
end
