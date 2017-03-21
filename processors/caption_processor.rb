require_relative 'processor'
module ImageProcessing
  module Processors
    # Processor that draws text over convert within defined area
    class CaptionProcessor < Processor
      def process(convert)
        return unless need_to_process?
        prepare convert
        setup_text convert
        draw_text convert
        convert.composite
      end

      private

      def prepare(convert)
        convert.background 'rgba(0,0,0,0)'
        reset_pointsize convert
      end

      def setup_text(convert)
        convert.fill color if color
        convert.undercolor undercolor if undercolor
        convert.font font if font
      end

      def draw_text(convert)
        convert.size "#{width}x#{height}"
        convert.caption text
        convert.geometry "+#{x}+#{y}"
      end

      def reset_pointsize(convert)
        convert << '+pointsize'
      end
    end
  end
end
