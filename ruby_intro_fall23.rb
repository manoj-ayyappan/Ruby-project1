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
  stack = []                                                  # create a stack for saving the order
  bracket_pairs = { ')' => '(', '}' => '{', ']' => '[' }      # create a dict with open and close brackets

  s.each_char do |ch|
    if bracket_pairs.values.include?(ch)
      stack.push(ch)                                          # push into stack
    elsif bracket_pairs.keys.include?(ch)
      return false if stack.empty? || stack.pop != bracket_pairs[ch]    # false if stack is empty or if last element does not match
    end
  end

  stack.empty?                                                # if stack empty --> match
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

p brackets_match?("{(})")