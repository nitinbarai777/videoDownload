class HomesController < ApplicationController
  require 'viddl-rb'
  require 'open-uri'

  def index
    # youtube
    # vimeo.com
    # yandex.video

    # https://www.youtube.com/watch?v=Dqzsu6PmkTw
    # https://www.youtube.com/watch?v=gvdf5n-zI14
    # https://www.youtube.com/watch?v=EEX_XM6SxmY

    # https://vimeo.com/206024794"
    # dailymotion.com
    # http://www.dailymotion.com/video/x5e553p_young-iraqis-volunteer-to-fix-potholes_news
    
    # path_to_video = Rails.root.join('data', 'some-video.mp4')
 
    # Dir.open("public/").each do |p|
    # p = File.split('.')
    # raise p.inspect
    # next if File.extname(p) != ".mp4"
    # filename = File.basename(p, File.extname(p))
    # newname = filename.upcase + File.extname(p)  
    # FileUtils.mv("#{path}/#{p}", "#{path}/#{newname}")
    # end
    if params[:videoUrl].present?
      video_info = YoutubeDL.download "#{params[:videoUrl]}", output: 'public/video.mp4'
      
      video_file_title = video_info.information[:title]  
      
      path_to_video = Rails.root.join('public', 'video.mp4')
      send_file path_to_video, :range => true, :type => 'video/mp4'
    end

    # path_to_video = Rails.root.join('public', 'some_file.mp4')
    # send_file path_to_video, :range => true, :type => 'video/mp4'
      # https://www.youtube.com/watch?v=gvdf5n-zI14
      # raise path_to_video.inspect
      # c = YoutubeDL.download "https://www.youtube.com/watch?v=EEX_XM6SxmY", output: 'public/some_file.mp4'
  end
end
