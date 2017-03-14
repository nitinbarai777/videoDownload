class HomesController < ApplicationController
  require 'viddl-rb'
  require 'open-uri'

  def index
  end

  def dashboard
    url = params["url"]
    if url.present?
      begin 
        # download video resolution wise
        # @video_info =  `youtube-dl -f 17 -g "#{params[:videoUrl]}"`
        # download top resolution video
        video_url =  `youtube-dl -g "#{url}"`
        title = `youtube-dl --get-filename "#{url}"`
        video_title = title.strip
        video_file = video_url.strip
        data = open(video_file)
        send_data data.read, filename: "#{video_title}", disposition: 'attachment', stream: 'true', buffer_size: '4096'
      rescue Exception => e
      end
    end
  end
end
