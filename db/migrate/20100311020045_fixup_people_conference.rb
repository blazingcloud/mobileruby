class FixupPeopleConference < ActiveRecord::Migration
  def self.up
    c = Conference.create!(:name => "LA Ruby Conference", :year => 2010)
    Person.all.each do |person|
      person.conferences << c
      person.save!
    end
  end

  def self.down
    Conference.delete_all
  end
end
