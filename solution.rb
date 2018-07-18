require 'benchmark'

class Emerald
  attr_accessor :next, :prev, :value

  def initialize(value)
    @value = value
    @prev = nil
    @next = nil
  end
end

class Diamond
  attr_accessor :head, :last

  def initialize(emerald)
    @emeralds = emerald
    @head = emerald
    @last = emerald
  end

  def add(emerald)
    update_emeralds(emerald, @last)
    @last = emerald
  end

  def insert(value, emerald)
    @old_e = forward_search(value)

    if @old_e.is_a?(Emerald)
      if @old_e.next != nil
        update_insert(@old_e, @old_e.next, emerald)
      else
        update_emeralds(emerald, @old_e)
      end
    else
      return "Invalid, No Such Value"
    end
  end

  def delete_second_emerald
    # 1st e
    @first_e = @head
    # 3rd e
    if @head.next.next != @head
      @third_e = @head.next.next

      @first_e.next = @third_e
      @third_e.prev = @first_e
    else
      @head.next = nil
      @head.prev = nil
    end
  end

  def forward_search(v)
    @e = @head
    forward_loop(v, @e)
  end

  def backward_search(v)
    @e = @last
    backward_loop(v, @e)
  end

  private
  def update_emeralds(new_emerald, old_emerald)
    old_emerald.next = new_emerald
    new_emerald.prev = old_emerald
    @head.prev = new_emerald
    new_emerald.next = @head
  end

  def update_insert(old_prev_e, old_next_e, new_e)
    old_prev_e.next = new_e
    old_next_e.prev = new_e
    new_e.prev = old_prev_e
    new_e.next = old_next_e
  end

  def forward_loop(v, e)
    while true
      if e.value == v
        result = e
        break
      end

      if e.next == nil
        result = "Cant be found"
        break
      else
        e = e.next
      end
    end

    result
  end

  def backward_loop(v, e)
    while true
      if e.value == v
        result = e
        break;
      end

      if e.prev == nil
        result = "Cant be found"
        break
      else
        e = e.prev
      end
    end

    result
  end

end

# Set up the data structure first
arr = (1..20000).to_a

# === Set up your Diamonds and Emeralds here! ===
first_e = Emerald.new(1)
diamond = Diamond.new(first_e)

(2..20000).each do |i|
  e = Emerald.new(i)
  diamond.add(e)
end

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
    while (diamond.head.next != nil)
      diamond.delete_second_emerald
    end
  end
end
