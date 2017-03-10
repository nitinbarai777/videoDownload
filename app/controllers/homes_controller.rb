  class HomesController < ApplicationController
  require 'viddl-rb'
  require 'open-uri'
  require 'fileutils'

  def index
    if params[:videoUrl].present?
      begin 
        # video_info = YoutubeDL.download "#{params[:videoUrl]}"
        @video_info =  `youtube-dl -g "#{params[:videoUrl]}"`
        title = `youtube-dl --get-filename "#{params[:videoUrl]}"`
        video_title = title.split("-")[0]
        # video_file_title = video_info.information[:requested_formats].first[:url] 
        # video_file_title = video_info.information[:title] 
        # @video_url = video_info.information[:url] || video_info.information[:requested_formats].first[:url]

        data = open(@video_info) 
        # video_file_title =  `youtube-dl --get-format "#{params[:videoUrl]}"`
        send_data data.read, filename: "#{video_title}", disposition: 'attachment', stream: 'true', buffer_size: '4096' 

        # respond_to do |format|
        #   @url = "/ajax_download?file=#{video_file_title}"
        #   format.js {render :partial => "downloadFile"}
      rescue Exception => e
      end
    end
  end

  # def ajax_download
  #   # path_to_video = Rails.root.join('public', 'video.mp4')
  #    folder = system 'realpath ~/Video'
  #    p path_to_video1
  #   send_file path_to_video1,:filename =>  "#{params[:file]}", :range => true, :type => 'video/mp4'
  #   # File.delete(path_to_video);
  # end
end


# file-name 
# youtube-dl -e "https://www.youtube.com/watch?v=2nBJ_FFQuLI"

# --get-duration                   Simulate, quiet but print video length
# --get-filename                   Simulate, quiet but print output filename
# --get-format 