class FixedStack < Stack
  def initialize(limit)
    super()
    @limit = limit
  end

  def push(val)
    if @sp >= @limit
      puts "Over limit"
      return
    end
    super(val)
  end

  def top
    return @stack[-1]
  end
end
