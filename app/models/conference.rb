class Conference < ActiveRecord::Base
  validates_presence_of :year
  validates_presence_of :name
end
