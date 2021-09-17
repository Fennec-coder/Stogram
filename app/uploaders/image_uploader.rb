# frozen_string_literal: true

class ImageUploader < Shrine
  plugin :default_url
  plugin :validation_helpers

  Attacher.default_url do |**_options|
    'otter by fen.png'
  end

  Attacher.validate do
    validate_extension %w[jpeg png gif jpg]
  end
end
