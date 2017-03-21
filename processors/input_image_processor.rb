require_relative 'processor'
module ImageProcessing
  module Processors
    class InputImageProcessor < Processor
      def process(convert)
        return unless need_to_process?
        open_image(convert)
        convert.geometry size + coordinates
        convert.colorize darken if darken
        convert.composite
      end

      private

      def open_image(convert)
        convert << source
      end

      def size
        "#{width}x#{height}!"
      end

      def coordinates
        '+0+0'
      end
    end
  end
end
