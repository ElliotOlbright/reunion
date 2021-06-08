class Reunion
  attr_reader :name, :activities
  def initialize(name)
    @name = name
    @activities = []
  end 

  def add_activity(activity)
    activities.push(activity)
  end 

  def total_cost
    total = @activities.flat_map do |activity|
      activity.participants.values
    end 
    total.sum     
  end


  def breakout
    total = @activities.flat_map do |activity|
      activity.owed
    end 
    total.inject{|h1,h2| h1.merge(h2){|_,x,y| x + y}}
  end 

  def summary
    string = ""
    breakout.each do |key, value|
      string << "#{key}: #{value}\n"
    end 
    string
    require "pry"; binding.pry
  end 

end 