class Conference < ActiveRecord::Base
  validates_presence_of :year
  validates_presence_of :name

  has_and_belongs_to_many :attendees, :class_name =>"Person"
end
