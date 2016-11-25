namespace :weibo do
  desc "pic get"

  task :pic => :environment do

    require "rest-client"
    require "json"

    uid = "1893765037"
    album_id = "3560876536637117"

    start_page=1
    end_page=500

    per_page = 60

    list_arrary = []
    (start_page..end_page).each do |page|
      url = "http://photo.weibo.com/photos/get_all?uid=#{uid}&album_id=#{album_id}&count=#{per_page}&page=#{page}&type=3"

      # puts url
      result = RestClient::Request.execute(method: :get, url: url,
        :cookies => {
          :SUB => '_2A251M_xeDeTxGedN7FcU-CbNyD-IHXVWSWqWrDV8PUNbmtBeLWvNkW904Vq51DjTyGmMIktFCh17ODGEfg..' ,
          :SUBP => '0033WrSXqPxfM725Ws9jqgMF55529P9D9WhnR2puq_1_hwxC_ds4YUL85JpX5KMhUgL.Fo20S0-f1hnpe0e2dJLoIpjLxK.L1K.L1hnLxKMLB.-LBozLxKBLBo.L12zt'
        }
      )
      # puts result
      # result.code
      # puts result.headers[:content_type] == "application/json"

      if result.headers[:content_type] == "application/json"
        JSON.parse(result.body)["data"]["photo_list"].each do |list|
          puts list
          ireads = Iread.where(mid:list["mid"])
          if ireads.present?
            puts "#{list["mid"]} ======== create picture"
            Picture.create(iread_id: ireads.last.id, url: list["url"])

          else
            puts "#{list["mid"]} ======== create picture and iread"

            iread = Iread.create(mid: list["mid"],caption: list["caption"],caption_render: list["caption_render"])

            Picture.create( iread_id: iread.id, url: list["url"])

          end
          sleep(0.0001)
        end
      else
        puts ">>>code:#{result.code}>>>>>> cookies 过期啦!! ,请先更新 cookies>>>>>>>>>>>>>>>>."
        break
      end
    end
  end
end
