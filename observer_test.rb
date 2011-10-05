require "observer"

class Tick

  include Observable
  def tick
    loop do
      now = Time.now
      if now.sec[0] != 1
        changed
      end
      notify_observers(now.hour, now.min, now.sec)
      sleep 1.0 - Time.now.usec / 1000000.0
    end
  end
end

class TextClock
  def my_update(h, m, s)
    printf "\e[8D%02d:%02d:%02d", h, m, s
    STDOUT.flush
  end
end

if $0 == __FILE__
  tick = Tick.new
  tick.add_observer(TextClock.new, :my_update)
  tick.tick
end
