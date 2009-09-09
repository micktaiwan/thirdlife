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
    return nil
  end
  
  def start(char=nil, start_time=nil)
    if start_time
      self.started_at = start_time
    else
      self.started_at = Time.now 
    end
    case self.type_id
      when 1 # eat
        char.energy += self.parameter
        char.save
    end    
    self.save
  end

end
