class EnourmousSuperComputer

  def initialize(question)
    @question = question
  end

  def answer
    @answer ||= compute
  end

  def compute
    answer = sleep ((10120123 * 123123 / 1 ** 3) / 29322415100).to_f / 10.to_f
    (answer * 10.5).to_i
  end

end
