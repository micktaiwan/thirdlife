class Action < ActiveRecord::Base

  # char: so we do no have to search for char again
  # start_time: started_at depend on previous action
  def make(char=nil, start_time=nil)
    start(char, start_time) if not self.started_at
    now = Time.now
    elapsed = now - self.started_at
    if elapsed > self.duration
      Action.destroy(self.id)
      return now - (elapsed - self.duration)
    end
    affect!(char)
    return nil
  end
  
  def start(char=nil, start_time=nil)
    if start_time
      self.started_at = start_time
    else
      self.started_at = Time.now 
    end
    self.save
  end
  
  def affect!(char)
    now = Time.now
    last_date = char.affected_at < self.started_at ? self.started_at : char.affected_at
    elapsed = now - last_date
    return if elapsed < 1
    factor = elapsed / self.duration
    get_cursors.each { |k,v|
      eval("char.#{k.to_s} += #{v*factor}")
      }
    char.affected_at = now
    char.save
  end

private

  def get_cursors
    eval(self.affects)
  end  
  
end

