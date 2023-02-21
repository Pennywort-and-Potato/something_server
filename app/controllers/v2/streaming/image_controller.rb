class V2::Streaming::ImageController < ApplicationController
  skip_before_action :authenticate_request
  def send_image
    file = Rails.root.join('public', 'images', "#{params[:file_name]}.png")

    if (!File.exist? file)
      return not_found("Image")
    end

    return send_file(file)
  end
end
