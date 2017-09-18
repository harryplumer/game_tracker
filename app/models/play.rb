class Play < ApplicationRecord
  belongs_to :passer, :class_name => 'Player'
  belongs_to :receiver, :class_name => 'Player'
  belongs_to :rusher, :class_name => 'Player'
  belongs_to :tackler, :class_name => 'Player'
  belongs_to :intercepted, :class_name => 'Player'
  belongs_to :fumble_forced, :class_name => 'Player'
  belongs_to :fumble_recovery, :class_name => 'Player'
end
