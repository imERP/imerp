Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :weibo, '4238632555', 'b05844e28b07445a4cd9cb1c3df7b59d'
end
