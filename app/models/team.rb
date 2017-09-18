class Team < ApplicationRecord
  validates_presence_of :name, :abbrev
  has_many :players
  has_many :games
end
