require_relative 'processor'

class InputImageProcessor < Processor
  def process(convert)
    return unless need_to_process?
    open_image(convert)
    colorify(convert) if color
  end

  def open_image(convert)
    convert << source
  end

  def colorify(convert)
    convert.fill color
    convert.draw "rectangle #{first_pixel} #{last_pixel}"
  end

  def source
    params[:source]
  end

  def color
    params[:color]
  end

  def first_pixel
    '0,0'
  end

  def last_pixel
    image = MiniMagick::Image.open(source)
    "#{image.width},#{image.height}"
  end
end
