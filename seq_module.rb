module Seq
  def self.fromtoby(from, to, by)
    x = from
    while x <= to
      yield x
      x += by
    end
  end
end

if __FILE__ == $0
  Seq.fromtoby(1, 10, 2) {|x| puts x}
end

