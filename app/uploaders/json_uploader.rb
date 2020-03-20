class JsonUploader < CarrierWave::Uploader::Base
  storage :file

  # version :pdf do
  #   process :json_to_pdf
  # end
  def create

  end
  def store_dir
    "/public/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
 
  def extension_white_list
    %w(pdf doc htm html docx jpg png jpeg txt json)
  end

  # def json_to_pdf
  # end
  def create_params
    params.permit(:image)
  end
end