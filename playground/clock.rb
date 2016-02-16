def angle_of_hands(hour, minutes)
  # Figure the angle of the hour by hour * 30
  # Figure the angle of the minute hand by minute * 6
  angle = ((hour * 30) - (minutes * 6)).abs
  angle > 180 ? 360 - angle : angle
end
