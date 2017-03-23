module ImageProcessing
  module Processors
    # Basic class for processors
    class Processor
      attr_reader :params

      ALLOWED_PARAMS = [:text, :x, :y, :width, :height, :color, :font, :source, :undercolor, :pointsize, :darken]

      def initialize(params)
        @params = params
      end

      def need_to_process?
        !params.nil? && !params.empty?
      end

      def method_missing(m, *args, &block)
        return params[m] if ALLOWED_PARAMS.include? m
        super
      end
    end
  end
end
