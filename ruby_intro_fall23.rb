# Part 1
def two_sum?(a, n)
  # ADD YOUR CODE HERE
end

def max_sub_array(a)
  # ADD YOUR CODE HERE
end

def group_anagrams(a)
  # ADD YOUR CODE HERE
end

# Part 2           

def brackets_match?(s)
  stack = []                      # stack for maintaining brackets
  s.each_char do |ch|
    case ch
    when "("
      stack<<ch
    when ")"
      return false if stack.empty?
      stack.pop
    
    end
  end
  true
end

def remove_and_append_vowels(s)
  # ADD YOUR CODE HERE
end

def highest_frequency_word(s)
  # ADD YOUR CODE HERE
end

# Part 3
class Book
  # ADD YOUR CODE HERE
end

p brackets_match?("(())")