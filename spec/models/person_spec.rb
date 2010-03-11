require 'spec_helper'

describe Person do
  describe "valid attributes" do
    before do
      @valid_attributes = {
        :name => "Jim Weirich"
      }
      @person = Person.create!(@valid_attributes)
    end

    it "should create a new instance given valid attributes" do
      @person.should be_valid
    end

    it "should have a list of conferences" do
      @person.conferences.should == []
    end

  end
  describe "invalid attributes" do

    it "should not allow blank name" do
      p = Person.new
      p.should_not be_valid
    end


  end

end
