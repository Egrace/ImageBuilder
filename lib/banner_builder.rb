require 'mini_magick'
require_relative 'processors/image_processor'
require_relative 'processors/area_text_processor'
require_relative 'processors/resize_processor'
require_relative 'processors/background_image_processor'
require_relative 'processors/single_line_text_processor'
require_relative 'processors/initial_processor'

module ImageProcessing
  # This class used to build banners
  class BannerBuilder
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
      @processors << Processors::BackgroundImageProcessor.new(source: source,
                                                              darken: darken,
                                                              width: width,
                                                              height: height)
      self
    end

    def with_image(source:, width:, height:, x:, y:)
      @processors << Processors::ImageProcessor.new(source: source,
                                                    x: x, y: y,
                                                    width: width,
                                                    height: height)
      self
    end

    def with_label(text:, x:, y:, color: 'black', font: 'Arial', pointsize: 14)
      @processors << Processors::SingleLineTextProcessor.new(text: text,
                                                             x: x, y: y,
                                                             color: color, font: font,
                                                             pointsize: pointsize)
      self
    end

    def with_area_text(text:, x:, y:, width:, height:, color: 'black', font: 'Arial')
      @processors << Processors::AreaTextProcessor.new(text: text,
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
