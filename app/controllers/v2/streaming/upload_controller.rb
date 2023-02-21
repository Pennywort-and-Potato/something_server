class V2::Streaming::UploadController < ApplicationController
  def upload_image

    file_name = "#{SecureRandom.uuid}.png"

    File.open(Rails.root.join('public', 'images', file_name), "wb") do |f|
      f.write(request.body.read)
    end

    return render json: {
      file_name: file_name,
      content_type: 'images/png',
      success: true
    }, status: :ok
  end
end
