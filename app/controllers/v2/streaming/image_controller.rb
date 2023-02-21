class V2::Streaming::ImageController < ApplicationController
  def send_image

    file = Rails.root.join('public', 'images', "#{params[:file_name]}.png")

    if (!File.exist? file)
      return not_found("Image")
    end

    return send_file(file)
  end
end
