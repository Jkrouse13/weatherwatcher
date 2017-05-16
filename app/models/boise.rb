class Boise < ApplicationRecord
  validates_presence_of :temp, :humidity
end
