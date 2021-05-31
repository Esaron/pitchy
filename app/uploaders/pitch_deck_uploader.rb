# frozen_string_literal: true

class PitchDeckUploader < CarrierWave::Uploader::Base
  EXTENSION_ALLOWLIST =
    %w(doc docx gif html jpeg jpg odf pdf png ppt pptx rtf svg swf wpd xls xlsx).freeze

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    EXTENSION_ALLOWLIST
  end
end
