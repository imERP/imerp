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
    has_one_attached :image
    has_many_attached :attachments

    scope :with_eager_loaded_images, -> { eager_load(attachments_attachments: :blob) }
end
