class HashMap
  attr_accessor :load_factor, :capacity

  def initialize(capacity = 8, load_factor = 0.75)
    @buckets = Array.new(capacity) { [] }
    @size = 0
    @capacity = capacity
    @load_factor = load_factor
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code
  end

  def set(key, value)
    index = hash(key) % @capacity
    bucket = @buckets[index]

    # Update existing key
    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end

    # Insert new key-value pair
    bucket << [key, value]
    @size += 1
  end

  def get(key)
    index = hash(key) % @capacity
    bucket = @buckets[index]

    bucket.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def has?(key)
    index = hash(key) % @capacity
    bucket = @buckets[index]

    bucket.each do |pair|
      return true if pair[0] == key
    end
    false
  end

  def remove(key)
    index = hash(key) % @capacity
    bucket = @buckets[index]

    removed = bucket.reject! { |pair| pair[0] == key }
    @size -= 1 if removed
  end

  def length
    @size
  end

  def clear
    @buckets = Array.new(@capacity) { [] }
    @size = 0
  end

  def keys
    result = []
    @buckets.each do |bucket|
      bucket.each { |pair| result << pair[0] }
    end
    result
  end

  def values
    result = []
    @buckets.each do |bucket|
      bucket.each { |pair| result << pair[1] }
    end
    result
  end

  def entries
    result = []
    @buckets.each do |bucket|
      bucket.each { |pair| result << pair }
    end
    result
  end

  def to_s
    entries.map { |key, value| "#{key}: #{value}" }.join(", ")
  end
end
