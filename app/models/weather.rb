class Weather < ApplicationRecord
  validates_presence_of :temp, :humidity, :city
end
