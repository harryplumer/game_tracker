class Player < ApplicationRecord
  belongs_to :team
  has_many :plays
  validates_presence_of :first_name, :last_name, :number, :position
end
