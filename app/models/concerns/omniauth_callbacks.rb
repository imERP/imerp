module OmniauthCallbacks
  extend ActiveSupport::Concern

  module ClassMethods
    %w(weibo qq github).each do |provider|
      define_method "find_or_create_for_#{provider}" do |response|
        uid = response['uid'].to_s
        data = response['info']

        if (user = Authorization.find_by(provider: provider, uid: uid).try(:user))
          user
        else
          user = User.new_from_provider_data(provider, uid, data)

          if user.save(validate: false)
            Authorization.find_or_create_by(provider: provider, uid: uid, user_id: user.id)
            return user
          else
            Rails.logger.warn("User.create_from_hash 失败，#{user.errors.inspect}")
            return nil
          end
        end
      end
    end

    def new_from_provider_data(provider, uid, data)
      User.new do |user|
        user.email =
          if data['email'].present? && !User.where(email: data['email']).exists?
            data['email']
          else
            "#{provider}+#{uid}@example.com"
          end

        user.name = data['name']
        user.username = data['nickname']
        user.username.gsub!(/[^\w]/, '_')

        # if provider == 'weibo'
        #   user.weibo = data['nickname']
        # end

        if user.username.blank?
          user.username = "u#{Time.now.to_i}"
        end

        if User.where(username: user.login).exists?
          user.username = "#{user.weibo}-weibo" # TODO: possibly duplicated user login here. What should we do?
        end

        user.password = Devise.friendly_token[0, 20]
        # user.location = data['location']
        user.bio  = data['description']
      end
    end
  end
end


# {
#   :provider => 'weibo',
#   :uid => '1234567890',
#   :info => {
#     :nickname => 'beenhero',
#     :name => 'beenhero',
#     :location => '浙江 杭州',
#     :image => 'http://tp4.sinaimg.cn/1640099215/50/1287016234/1',
#     :description => '移步twitter@beenhero',
#     :urls => {  :Blog => 'http://beenhero.com'
#                 :Weibo => 'http://weibo.com/beenhero'
#     },
#   },
#   :credentials => {
#     :token => '2.00JjgzmBd7F...', # OAuth 2.0 access_token, which you may wish to store
#     :expires_at => 1331780640, # when the access token expires (if it expires)
#     :expires => true # if you request `offline_access` this will be false
#   },
#   :extra => {
#     :raw_info => {
#       ... # data from /2/users/show.json, check by yourself
#     }
#   }
# }
