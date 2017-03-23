require_relative 'processor'
module ImageProcessing
  module Processors
    # Processor that resizes convert
    class ResizeProcessor < Processor
      def process(convert)
        convert.resize "#{width}x#{height}"
      end
    end
  end
end
