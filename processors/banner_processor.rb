require_relative 'processor'

class BannerProcessor < Processor
  def process(convert)
    return unless need_to_process?
    convert.draw "image over 0,0 0,0 '#{banner_source}'"
  end

  def need_to_process?
    !params.nil?
  end

  def banner_source
    params[:source]
  end
end
