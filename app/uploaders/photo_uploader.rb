# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :fog
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  photo = nil
  def store_dir
    photo = model
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  process :resize_to_fill => [640, 480]
  
  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_limit => [200, 200]
  end

  version :crop_small do
    process :resize_to_fill => [200, 200]
    process :crop => [::Magick::CenterGravity, 142, 130]
  end

  version :cover do
    process :resize_to_fill => [140, 130]
  end

  version :crop_large do
    process :resize_to_fill => [250, 250]
    process :crop => [::Magick::CenterGravity, 208, 150]
  end

  version :crop_home do
    process :resize_to_fill => [200, 200]
    process :crop => [::Magick::CenterGravity, 158, 158]
  end

  version :medium do
    process :resize_to_fill => [800, 600]
    process :overlay_images
  end

  # Add a white list of extensions which are allowed to be uploaded.

  def overlay_images
    manipulate! format: "png" do |source|
      overlay_path = Rails.root.join("public/images/logo_site.png")
      overlay = Magick::Image.read(overlay_path).first
      overlay.resize_to_fill(30, 30)
      source.composite!(overlay, 20, 20, Magick::OverCompositeOp)
    end
  end
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png tiff)
  end

  def crop(gravity, w, h) 
    manipulate! do |img|
      img.crop(gravity, w, h)
    end
  end




  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
