class Stack
  def initialize
    @stack = []
    @sp = 0
  end

  def push(value)
    @stack[@sp] = value
    @sp += 1
  end

  def pop
    return nil if @sp == 0
    @sp -= 1
    return @stack.pop
  end

  def to_s
    @stack
  end
end

