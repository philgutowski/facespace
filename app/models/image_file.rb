class ImageFile
  def initialize(data)
    @data = data
  end

  def decode
    base64_data = @data.sub("data:image/png;base64,", "")
    image_data = Base64.decode64(base64_data)

    file = File.new("tmp/image.png", 'wb')
    file.write image_data
    file
  end
end
