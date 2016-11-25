class Picture < ApplicationRecord
	belongs_to :iread

  validates :iread_id, presence: true
  # validates :url, uniqueness: { scope: :iread_id }
end
