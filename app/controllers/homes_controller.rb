class HomesController < ApplicationController
  require 'viddl-rb'
  require 'open-uri'

  def index
    if params[:videoUrl].present?
      begin 
        # download video resolution wise
        # @video_info =  `youtube-dl -f 17 -g "#{params[:videoUrl]}"`
        # download top resolution video
        @video_info =  `youtube-dl -g "#{params[:videoUrl]}"`
        title = `youtube-dl --get-filename "#{params[:videoUrl]}"`
        video_title = title.strip

        data = open(@video_info)
        send_data data.read, filename: "#{video_title}", disposition: 'attachment', stream: 'true', buffer_size: '4096'
      rescue Exception => e
      end
    end
  end
end
