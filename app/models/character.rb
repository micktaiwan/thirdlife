class Character < ActiveRecord::Base

  def update_char
    now = Time.now
    self.age = (now - self.created_at)/1.day
    self.energy -= 5*((now - self.updated_at)/1.hour)
    save
  end  
  
end
