class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash = 0
    self.each_with_index do |el,index| 
      hash += (el+index).hash
    end
    hash
  end
end

class String
  def hash
    alphabet = ('A'..'z').to_a
    hash = 0
    self.each_char.with_index do |el,index|
      hash += (alphabet.index(el) + index).hash
    end
    hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash = 0
    self.each do |k,v|
      hash += v.hash
    end
    hash
  end
end
