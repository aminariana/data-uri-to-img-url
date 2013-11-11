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
  before_create :generate_token

  def to_param
    token
  end

  def decode
    @decode ||= Base64.decode64(data_uri)
  end

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(8, false)
      break random_token unless Image.exists?(token: random_token)
    end
  end
end
