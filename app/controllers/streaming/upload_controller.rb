class Streaming::UploadController < ApplicationController
  def upload_image

    rand_uuid = SecureRandom.uuid
    file_extension = "webp"
    file_name = "#{rand_uuid}.#{file_extension}"
    content_type = "image/#{file_extension}"

    File.open(Rails.root.join('public', 'images', file_name), "wb") do |f|
      f.write(request.body.read)
    end

    UploadPool.create({
      src: file_name,
      content_type: content_type,
      alt: rand_uuid
    })

    return render json: {
      file_name: file_name,
      content_type: content_type,
      alt: rand_uuid,
      success: true
    }, status: :ok
  end
end
