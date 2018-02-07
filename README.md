# Rails 5.2

新版本功能试用.


1. Active Storage (类似 Carrierwave 的实现） - https://github.com/rails/rails/tree/v5.2.0.rc1/activestorage
https://evilmartians.com/chronicles/rails-5-2-active-storage-and-beyond
2. Built-in Redis cache store - https://github.com/rails/rails/pull/31134
3. Implement H2 Early Hints for Rails - https://github.com/rails/rails/pull/30744
http://eileencodes.com/posts/http2-early-hints/
4. Ships with Bootsnap by default - https://github.com/Shopify/bootsnap
Webpacker 3.0

5. Credentials
参数文件配置, 以前借助于 setting 等 Gem, 现在 rails 5.2 已集成进来, 并且增加安全性能,
文件存储在 onfig/credentials.yml.enc

- 修改配置文件:

>EDITOR=vi bin/rails credentials:edit

- 查看配置文件

>bin/rails credentials:show

- 获取配置

单个:

>Rails.application.credentials.key_name

嵌套:

>Rails.application.credentials.dig(:section_name, :nested_key_name)
or
>Rails.application.credentials.key_name[:nested_key_name]
