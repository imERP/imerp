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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_one_attached :image, dependent: :destroy
    has_many_attached :attachments, dependent: :destroy


    # # Synchronously destroy the avatar and actual resource files.
    # user.avatar.purge

    # # Destroy the associated models and actual resource files async, via Active Job.
    # user.avatar.purge_later
    #

    # The redirection has an HTTP expiration of 5 min.

    # url_for(user.avatar)
    # To create a download link, use the rails_blob_{path|url} helper. Using this helper allows you to set the disposition.
    # rails_blob_path(user.avatar, disposition: "attachment")

    # Previewing Files
    # <%= image_tag file.preview(resize: "100x100>") %>
    scope :with_eager_loaded_images, -> { eager_load(attachments_attachments: :blob) }

    def image_url
    Rails.cache.fetch(self.cache_key("image_url")) do
        self.image.service_url
    end
  end
end
