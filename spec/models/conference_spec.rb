require 'spec_helper'

describe Conference do
  describe "valid attributes" do
    before do
      @valid_attributes = {
        :name => "LA Ruby Conference",
        :year => 2010
      }
      @conf = Conference.create!(@valid_attributes)
    end

    it "should create a new instance given valid attributes" do
      @conf.should be_valid
    end

    it "should have a list of attendees" do
      @conf.attendees.should == []
    end


  end
  describe "invalid attributes" do
    before do
        @name = "LA Ruby Conference"
        @year = 2010
    end

    it "should not allow blank name" do
      c = Conference.new(:year => @year)
      c.should_not be_valid
    end

    it "should not allow blank year" do
      c = Conference.new(:name => @name)
      c.should_not be_valid
    end


  end

end
