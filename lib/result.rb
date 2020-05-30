class Result
  attr_accessor :errs, :data

  def initialize(errs, data)
    @errs = errs
    @data = data
  end

  def success?
    errs.empty?
  end

  def failed?
    !success?
  end
end
