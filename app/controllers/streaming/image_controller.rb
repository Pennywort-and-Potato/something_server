class Streaming::ImageController < ApplicationController
  skip_before_action :authenticate_request
  def send_image
    file_extension = "webp"
    file = Rails.root.join('public', 'images', "#{params[:file_name]}.#{file_extension}")

    if (!File.exist? file)
      return not_found("Image")
    end

    return send_file(file)
  end
end
