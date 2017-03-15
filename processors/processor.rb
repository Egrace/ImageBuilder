class Processor
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def need_to_process?
    !params.nil?
  end
end
