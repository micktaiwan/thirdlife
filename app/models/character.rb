class Character < ActiveRecord::Base

  def update_char
    now = Time.zone.now
    elapsed = now - self.time_updated_at
    return if elapsed < 1
    self.age = (now - self.created_at)/1.day
    self.energy -= 5*(elapsed/1.hour)
    make_actions
    self.time_updated_at = now
    save
  end
  
  def make_actions
    next_start_time = nil
    actions.each { |a|
      next_start_time = a.make(self, next_start_time)
      break if not next_start_time
      }
  end
  
  def actions
    Action.find(:all, :conditions=>["character_id=?",self.id], :order=>"id")
  end  
  
  def eat
    a = Action.create(
      :character_id=>self.id,
      :duration=>15.minute,
      :type_id=>1,
      :affects=>"{:energy=>10}")
    a.start(self) if actions.size == 1
  end
  
end

