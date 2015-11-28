def swap(h)
  h2 = {}
  h.each do |k,v|
    h2[v] = k
  end
  h2
end
