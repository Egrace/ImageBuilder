require_relative 'processor'

class CaptionProcessor < Processor
  def process(convert)
    return unless need_to_process?
    convert.background 'rgba(0,0,0,0)'
    convert.fill color
    convert << "+pointsize"
    convert.undercolor undercolor if undercolor
    convert.font font
    convert.pointsize pointsize if pointsize
    convert.strokewidth strokewidth if strokewidth
    convert.stroke stroke if stroke
    convert.size "#{width}x#{height}"
    convert.caption text
    convert.geometry "+#{x}+#{y}"
    convert.composite
  end

  def text
    params[:text]
  end

  def pointsize
    params[:pointsize]
  end

  def font
    params[:font] || 'Arial'
  end

  def color
    params[:color] || 'black'
  end

  def undercolor
    params[:undercolor]
  end

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

  def strokewidth
    params[:strokewidth]
  end

  def stroke
    params[:stroke]
  end
end
