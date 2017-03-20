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
        convert.fill color
        convert.undercolor undercolor if undercolor
        convert.font font
      end

      def draw_text(convert)
        convert.size "#{width}x#{height}"
        convert.caption text
        convert.geometry "+#{x}+#{y}"
      end

      def reset_pointsize(convert)
        convert << '+pointsize'
      end

      def text
        params[:text]
      end

      def pointsize
        params[:pointsize]
      end

      def font
        params[:font] || 'Arial'
      end

      def color
        params[:color] || 'black'
      end

      def undercolor
        params[:undercolor]
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
    end
  end
end
