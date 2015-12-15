def angle_of_hands(hour, minutes)
  angle = ((hour * 30) - (minutes * 6)).abs
  angle > 180 ? 360 - angle : angle
end
