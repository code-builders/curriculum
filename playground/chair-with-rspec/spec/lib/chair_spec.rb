require "./lib/chair"

describe Chair do
  before do
    @chair = Chair.new("Vilgot")
  end

  describe "`new` method" do

    it "returns a new instance of the Chair class" do
      expect(@chair).to be_an_instance_of Chair
    end

    it "takes an argument and assigns it to the @name attribute" do
      expect(@chair.name).to eq "Vilgot"
      # expect("Vilgot").to eq "Vilgot"
    end
  end

  describe "#yell" do
    it "returns the name in all caps" do
      expect(@chair.yell).to eq "VILGOT!!"
    end
  end
end
