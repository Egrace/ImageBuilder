require_relative 'processor'
module ImageProcessing
  module Processors
    # This processor draws single string label over convert
    class SingleLineTextProcessor < Processor
      def process(convert)
        return unless need_to_process?
        convert.font font
        convert.fill color
        convert.pointsize pointsize
        convert.draw "text #{position} \"#{text}\""
      end

      private

      def position
        "#{x},#{y}"
      end
    end
  end
end
