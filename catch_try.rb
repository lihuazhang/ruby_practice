#! /usr/bin/ruby
#
#我们首先用“catch(:done)”标注了一个块，
#当执行到“throw :done”时,中止当前“catch(:done)”所标注的块，
#处理流程继续向下处理。 在catch/throw中，当碰到throw时，
#Ruby会展开调用堆栈来查找匹配的catch，
#当找到后，堆栈会被展开，catch块剩余的代码不会被执行。 
#Ruby中没有goto 语句，但你可以使用catch/throw或异常来实现goto的功能。 
#

def m(n)
  puts n
  throw :done unless n > 0
  m(n-1)
end

catch(:done) {
  m(3)
  puts "Cannot reach here!"
}

puts "Reach here!"
