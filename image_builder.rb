require 'mini_magick'
require_relative 'processors/banner_processor'
require_relative 'processors/caption_processor'
require_relative 'processors/resize_processor'
require_relative 'processors/input_image_processor'
require_relative 'processors/label_processor'
require_relative 'processors/initial_processor'

module ImageProcessing
  # This class used to build banners
  class ImageBuilder
    attr_reader :width, :height
    attr_reader :processors

    def initialize(width:, height:)
      @width = width
      @height = height
      @processors = [
        Processors::InitialProcessor.new(width: width, height: height)
      ]
    end

    def with_background_image(source:, darken: '0%')
      @processors << Processors::InputImageProcessor.new(source: source,
                                                         darken: darken,
                                                         width: width,
                                                         height: height)
      self
    end

    def with_logo(source:, width:, height:, x:, y:)
      @processors << Processors::BannerProcessor.new(source: source,
                                                     x: x, y: y,
                                                     width: width,
                                                     height: height)
      self
    end

    def with_title(text:, x:, y:, color: 'black', font: 'Arial', pointsize: 14)
      @processors << Processors::LabelProcessor.new(text: text,
                                                    x: x, y: y,
                                                    color: color, font: font,
                                                    pointsize: pointsize)
      self
    end

    def with_caption(text:, x:, y:, width:, height:, color: 'black', font: 'Arial')
      @processors << Processors::CaptionProcessor.new(text: text,
                                                      x: x, y: y,
                                                      width: width,
                                                      height: height,
                                                      color: color, font: font)
      self
    end

    def build(destination)
      MiniMagick::Tool::Convert.new do |convert|
        processors.each { |p| p.process(convert) }
        convert << destination
      end
    end
  end
end
