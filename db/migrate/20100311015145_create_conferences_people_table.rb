  class CreateConferencesPeopleTable < ActiveRecord::Migration
  def self.up
     create_table :conferences_people, :id => false do |t|
       t.integer :conference_id
       t.integer :person_id
     end
  end

  def self.down
    drop_table :conferences_people    
  end
end
