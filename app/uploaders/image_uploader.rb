# frozen_string_literal: true

class ImageUploader < Shrine
  plugin :default_url
  plugin :validation_helpers

  Attacher.default_url do |**_options|
    "gif-preview.gif"
    "jpg-preview.jpg"
    "png-preview.png"
    "avatar.jpg"
  end

  Attacher.validate do
    validate_extension %w[png gif jpg]
  end
end
