class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include OmniauthCallbacks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable



  has_many :authorizations, dependent: :destroy


  def bind_service(response)
    provider = response['provider']
    uid = response['uid'].to_s
    authorizations.create(provider: provider, uid: uid)
  end

end
