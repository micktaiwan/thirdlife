class Character < ActiveRecord::Base

  def update_char
    now = Time.zone.now
    elapsed = now - self.time_updated_at
    return if elapsed < 1
    time_action(now,elapsed)
    make_actions
    verify_cursors
    self.time_updated_at = now
    save
  end

  def time_action(now,elapsed)
    self.age     = (now - self.created_at)/1.day
    self.energy -= 1*(elapsed/1.hour)
    self.health -= 1*(elapsed/1.hour)
    self.hunger += 1*(elapsed/1.hour)
    self.mood   -= 1*(elapsed/1.hour)
  end
  
  def make_actions
    next_start_time = nil
    actions.each { |a|
      next_start_time = a.make(self, next_start_time)
      @current_action = a
      break if not next_start_time
      }
  end
  
  def verify_cursors
 
    to_destroy = nil
    
    if self.hunger < 0
      self.hunger = 0
      destroy_next_if(ACTION_EAT)
      # TODO log, so we can tell the user
    end

    if self.mood > 100
      self.mood = 100
      destroy_next_if(ACTION_PLAY)
      # TODO log, so we can tell the user
    end

    if self.energy > 100
      self.energy = 100
      destroy_next_if(ACTION_SLEEP)
      # TODO log, so we can tell the user
    end
  
    start_next
  
  end
  
  def start_next
    a = Action.find(:first, :conditions=>["character_id=?",self.id], :order=>"id")
    a.start(self, nil) if a
  end  
  
  def actions
    Action.find(:all, :conditions=>["character_id=?",self.id], :order=>"id")
  end  

  def destroy_next_if(type_id)
    actions.each { |a|
      break if a.type_id != type_id
      a.destroy 
      }
  end

  def do_action_type(type)
    case type
    when ACTION_EAT;    eat
    when ACTION_SLEEP;  sleep
    when ACTION_PLAY;   play
    end
  end
  
  def eat
    a = Action.create(
      :character_id=>self.id,
      :duration=>3.minute,
      :type_id=>1,
      :affects=>"{:energy=>5, :health=>5, :mood=>5, :hunger=>-50}")
    a.start(self) if actions.size == 1
  end

  def sleep
    a = Action.create(
      :character_id=>self.id,
      :duration=>5.minutes,
      :type_id=>2,
      :affects=>"{:energy=>50, :health=>5, :mood=>50}")
    a.start(self) if actions.size == 1
  end

  def play
    a = Action.create(
      :character_id=>self.id,
      :duration=>2.minutes,
      :type_id=>3,
      :affects=>"{:energy=>-10, :health=>1, :mood=>50, :hunger=>5, :xp=>1}")
    a.start(self) if actions.size == 1
  end
  
end

