class Character < ActiveRecord::Base

  def update_char
    now = Time.now
    self.age = (now - self.created_at)/1.day
    self.energy -= 5*((now - self.updated_at)/1.hour)
    make_actions
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
    a = Action.create(:character_id=>self.id, :type_id=>1, :parameter=>10, :duration=>15.minute)
    a.start(self) if actions.size == 1
  end
  
end

