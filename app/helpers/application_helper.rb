# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include AuthenticatedSystem

  def display_age(age)
    yf    = age
    y     = yf.to_i
    
    mf12  = (yf-y) * 12
    m     = mf12.to_i
    
    df30  = (mf12-m)*365/12
    d     = df30.to_i
    
    hf24  = (df30-d) * 24
    h     = hf24.to_i
    
    str  = ""
    str += "#{y} years" if y > 0
    str += " #{m} months" if m > 0
    str += " #{d} days" if d > 0
    str += " #{h} hours" if h > 0
    str
  end

end

