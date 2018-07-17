class Emerald
end

class Diamond
end

# Set up the data structure first
arr = (1..20000).to_a

# Start the first timestamp only after the data structure has been set up, so that we only time the duration of the element removals
backthen = Time.new

while (arr.size > 1) do
  arr.slice!(1, 1)
end

now = Time.new

puts now - backthen