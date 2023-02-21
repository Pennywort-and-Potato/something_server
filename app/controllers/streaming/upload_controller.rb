class Streaming::UploadController < ApplicationController
  def upload_image

    file_extension = "webp"
    file_name = "#{SecureRandom.uuid}.#{file_extension}"
    content_type = "images/#{file_extension}"

    File.open(Rails.root.join('public', 'images', file_name), "wb") do |f|
      f.write(request.body.read)
    end

    UploadPool.create({
      src: file_name,
      content_type: content_type
    })

    return render json: {
      file_name: file_name,
      content_type: "images/#{file_extension}",
      success: true
    }, status: :ok
  end
end
