require 'benchmark'

class Emerald
end

class Diamond
end

# Set up the data structure first
arr = (1..20000).to_a

# === Set up your Diamonds and Emeralds here! ===


# ===============================================

# Start the first timestamp only after the data structure has been set up, so that we only time the duration of the element removals
Benchmark.bm do |bm|
  puts "Removal of elements from array"
  bm.report do
    while (arr.size > 1) do
      arr.slice!(1, 1)
    end
  end

  puts "Removal of Emeralds from Diamond"
  bm.report do
    # === Insert your code to remove Emeralds from Diamonds here ===
    
  end
end