require_relative 'processor'

class ResizeProcessor < Processor
  def process(convert)
    convert.resize "#{params[:width]}x#{params[:height]}"
  end
end
