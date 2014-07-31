class ImageUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    nil
  end

  def move_to_cache
    true
  end

  def move_to_store
    true
  end
end
