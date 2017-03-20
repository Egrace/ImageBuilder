require_relative 'processor'
module ImageProcessing
  module Processors
    # Processor that resizes convert
    class ResizeProcessor < Processor
      def process(convert)
        convert.resize "#{params[:width]}x#{params[:height]}"
      end
    end
  end
end
