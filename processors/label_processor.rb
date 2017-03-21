require_relative 'processor'
module ImageProcessing
  module Processors
    # This processor draws single string label over convert
    class LabelProcessor < Processor
      def process(convert)
        return unless need_to_process?
        convert.font font
        convert.fill color
        convert.pointsize pointsize
        convert.draw "text #{position} \"#{text}\""
      end

      def x
        params[:x]
      end

      def y
        params[:y]
      end

      def text
        params[:text]
      end

      def font
        params[:font]
      end

      def pointsize
        params[:pointsize]
      end

      def color
        params[:color]
      end

      private

      def position
        "#{params[:x]},#{params[:y]}"
      end
    end
  end
end
