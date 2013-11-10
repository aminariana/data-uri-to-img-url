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

require 'spec_helper'

describe Image do
  pending "add some examples to (or delete) #{__FILE__}"
end
