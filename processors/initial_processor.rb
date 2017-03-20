require_relative 'processor'

module ImageProcessing
  module Processors
    # Initializes convert with defined size and color background
    class InitialProcessor < Processor
      def process(convert)
        return unless need_to_process?
        convert.size size
        convert.xc background_color
      end

      private

      def background_color
        'black'
      end

      def size
        "#{width}x#{height}"
      end

      def width
        params[:width]
      end

      def height
        params[:height]
      end
    end
  end
end
