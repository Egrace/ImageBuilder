require_relative 'processor'
require 'mini_magick'

module ImageProcessing
  module Processors
    # Draws company logo over convert
    class BannerProcessor < Processor
      def process(convert)
        return unless need_to_process?
        convert << source
        convert.geometry size + coordinates
        convert.composite
      end

      def source
        params[:source]
      end

      def width
        params[:width]
      end

      def height
        params[:height]
      end

      def x
        params[:x]
      end

      def y
        params[:y]
      end

      private

      def size
        return '' if width.nil? || height.nil?
        "#{width}x#{height}"
      end

      def coordinates
        return '+0+0' if x.nil? || y.nil?
        "+#{x}+#{y}"
      end
    end
  end
end
