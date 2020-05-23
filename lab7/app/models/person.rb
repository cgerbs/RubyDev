class Person < ApplicationRecord
  validates :name, presence: true # this requires that each instance of Person has a name
end
