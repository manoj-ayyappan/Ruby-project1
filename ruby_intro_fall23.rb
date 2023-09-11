# Part 1
def two_sum?(a, n)
  for i in a do
    for j in a[1, a.length()] do
      if i + j == n
        return "True"
      end
    end
  end
  return "False"
end

def max_sub_array(a)
  curr_max = -9999
  max_ends = 0
  for i in a do
    max_ends = max_ends + i
    if curr_max < max_ends
      curr_max = max_ends
    end
    if max_ends < 0
      max_ends = 0
    end
  end
  return curr_max
end

def group_anagrams(a)
  result = {}
  str1 = ""
  for i in a do
    dict1 = {}
    temp = []
    j = i
    i = i.chars.sort(&:casecmp).join
    i.each_char do |letter|
      if dict1.key?(letter)
        dict1[letter] = dict1[letter].to_i + 1
      else
        dict1[letter] = 1
      end
    end
    dict1.each do |key, val|
      str1 = key + val.to_s
      temp.append(str1)
    end
    tuple_temp = temp.to_a
    if result.keys.include?(tuple_temp)
      tuple_temp = temp.to_a
      result[tuple_temp] += [j]
    else
      tuple_temp = temp.to_a
      result[tuple_temp] = [j]
    end
  end
  return result.values
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
  vowels = "aeiouAEIOU"                                       # list of vowels to remove
  rest = ""                                                   # rest of the word
  to_be_appended = ""                                         # list of vowels removed

  s.each_char do |ch|
    if vowels.include?(ch)
      to_be_appended += ch
    else
      rest += ch
    end
  end

  rest + to_be_appended                                       # combine to get answer
end

def highest_frequency_word(s)
  words = s.downcase.split(/\s+/)                             # lowercase and split words
  word_frequency = Hash.new(0)                                # create a hash

  words.each do |word|
    word_frequency[word] += 1                                 # keep track of frequency
  end

  max_frequency = word_frequency.values.max
  most_frequent_words = word_frequency.select { |_word, freq| freq == max_frequency }

  result_word = words.find { |word| most_frequent_words.key?(word) }        # first occurrence of the most frequent word

  result_word
end

# Part 3
class Book
  # Constructor to initialize Title and Price of Book
  def initialize(title, price)
    self.title = title
    self.price = price
  end

  # Getter for Book Title
  def title
    @title
  end

  # Setter for Book Title
  def title=(value)
    if value.nil? || value.strip.empty?
      raise ArgumentError, "Invalid title, it cannot be nil or an empty string."
    end
    @title = value
  end

  # Getter for Book Price
  def price
    @price
  end

  # Setter for Book Price
  def price=(value)
    if value.nil? || value <= 0
      raise ArgumentError, "Invalid price, it cannot be nil or less than or equal to zero."
    end
    @price = value
  end

  # Method to return Book Price in specified format
  def formatted_price
    dollars = @price.to_i
    cents = ((@price - dollars) * 100).round
    if dollars > 0 && cents > 0
      dollars_str = dollars == 1 ? "dollar" : "dollars"
      cents_str = cents == 1 ? "cent" : "cents"
      return "#{dollars} #{dollars_str} and #{cents} #{cents_str} only"
    elsif dollars > 0
      dollars_str = dollars == 1 ? "dollar" : "dollars"
      return "#{dollars} #{dollars_str} only"
    else
      cents_str = cents == 1 ? "cent" : "cents"
      return "#{cents} #{cents_str} only"
    end
  end
end
