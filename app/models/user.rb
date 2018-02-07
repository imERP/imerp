# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
    has_one_attached :image, dependent: :destroy
    has_many_attached :attachments, dependent: :destroy

    scope :with_eager_loaded_images, -> { eager_load(attachments_attachments: :blob) }

    def image_url
    Rails.cache.fetch(self.cache_key("image_url")) do
        self.image.service_url
    end
  end
end
