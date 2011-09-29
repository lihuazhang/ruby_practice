class Sequence
  def initialize(from, to, by)
    @from, @to, @by = from, to, by
  end

  def each
    x = @from
    while x <= @to
      yield x
      x = x + @by
    end
  end

  def length
    return 0 if @to < @from
    Integer((@to - @from)/@by) + 1
  end

  def [](index)
    return nil if index < 0
    v = @from + index*@by
    if v <= @to
      v
    else
      nil
    end
  end

  def *(factor)
    Sequence.new(@from*factor, @to*factor, @by*factor)
  end

  def +(offset)
    Sequence.new(@from + offset, @by + offset, @by)
  end
end

if __FILE__ == $0
  s = Sequence.new(1, 10, 2)
  s.each {|x| puts x}
end
