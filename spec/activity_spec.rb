require './lib/activity'
require 'rspec'
RSpec.describe Activity do
  describe 'Object Creation' do
    it 'exists' do
      activity = Activity.new("Brunch")
      expect(activity).to be_a(Activity)
    end

    it 'has readable attributes' do
      activity = Activity.new("Brunch")
      expect(activity.name).to eq("Brunch")
      expect(activity.participants).to eq({})
    end 
  end
  
  before :each do
    @activity = Activity.new("Brunch")
    @activity.add_participant("Maria", 20)
  end 

  describe 'Object Methods' do
    it ' can add_participant' do
      expect(@activity.participants).to eq({"Maria" => 20})
    end 

    it 'can total cost of activity' do
      @activity.add_participant("Luther", 40)

      expect(@activity.participants).to eq({"Luther" => 40, "Maria" => 20 })
      expect(@activity.total_cost).to eq(60)
    end

    it 'can total participants' do
      @activity.add_participant("Luther", 40)

      expect(@activity.total_participants).to eq(2)
    end 

    it 'can split cost' do 
      @activity.add_participant("Luther", 40)

      expect(@activity.split).to eq(30)
      expect(@activity.participants).to eq({"Luther" => 40, "Maria" => 20 })
      expect(@activity.total_cost).to eq(60)
    end 

    it 'can show owed after split' do
      @activity.add_participant("Luther", 40)

      expect(@activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end 
  end 
end