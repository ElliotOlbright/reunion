class Activity
  attr_reader :name, :participants
    def initialize(name)
    @name = name
    @participants = {}
  end 

  def add_participant(name, amount_owed)
    @participants[name] = amount_owed
  end 
  
  def total_cost
    @participants.values.sum
  end 

  def total_participants
    @participants.keys.count
  end

  def split
    total_cost / total_participants
  end

  def owed 
    @participants.reduce({}) do |hash, (name, spent)|
      hash.merge(name => split - spent)
    end
  end 


end 

