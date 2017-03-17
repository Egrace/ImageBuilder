require_relative 'processor'
require 'mini_magick'

class BannerProcessor < Processor
  def process(convert)
    return unless need_to_process?
    #convert.draw "image over 0,0 0,0 '#{banner_source}'"
    banner = MiniMagick::Image.new(banner_source)
    convert << banner_source
    convert.geometry size + coordinates
    convert.composite
  end

  def banner_source
    params[:source]
  end

  def size
    return "" if width.nil? || height.nil?
    "#{width}x#{height}"
  end

  def coordinates
    return "+0+0" if x.nil? || y.nil?
    "+#{x}+#{y}"
  end

  private

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
