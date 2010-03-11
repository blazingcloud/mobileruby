require 'spec_helper'

describe Person do
  describe "valid attributes" do
    before do
      @valid_attributes = {
        :name => "Jim Weirich"
      }
    end

    it "should create a new instance given valid attributes" do
      p = Person.create!(@valid_attributes)
      p.should be_valid
    end


  end
  describe "invalid attributes" do

    it "should not allow blank name" do
      p = Person.new
      p.should_not be_valid
    end


  end

end
