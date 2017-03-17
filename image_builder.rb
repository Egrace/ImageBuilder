require 'mini_magick'
require_relative 'processors/banner_processor'
require_relative 'processors/caption_processor'
require_relative 'processors/resize_processor'
require_relative 'processors/input_image_processor'
require_relative 'processors/label_processor'

class ImageBuilder
  attr_reader :image
  attr_reader :convert
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def process
    MiniMagick::Tool::Convert.new do |convert|
      InputImageProcessor.new(params[:image]).process(convert)
      ResizeProcessor.new(params[:resize]).process(convert)
      LabelProcessor.new(params[:title]).process(convert)
      CaptionProcessor.new(params[:caption]).process(convert)
      BannerProcessor.new(params[:banner]).process(convert)
      save_image(convert)
    end
  end

  def mask_image(convert)
    convert.fill 'rgba(0, 0, 0, 0.3)'
    convert.draw 'rectangle 0,0 600,200'
  end

  def save_image(convert)
    convert << params[:result]
  end
end
