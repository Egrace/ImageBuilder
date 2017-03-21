module ImageProcessing
  module Processors
    # Basic class for processors
    class Processor
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def need_to_process?
        !params.nil? && !params.empty?
      end
    end
  end
end
