module FunWithStrings
  def palindrome?
    # remove non-word chars, turn words into lower case
    self.gsub(/\W/, "").downcase == self.gsub(/\W/, "").downcase.reverse
  end
  def count_words
    # split string into words, count each word occurence
    words = self.split(/\W+/)
    wordCounts = Hash.new(0)
    words.each do |w|
    	w = w.downcase.strip
    	(wordCounts[w] += 1) if !(w.empty?) 
    end
    return wordCounts
  end
  def anagram_groups
    # your code here
    groupsMap = Hash.new
    words = self.split(/\W+/)
    words.each do |w|
    	sortedWord = w.downcase.strip.chars.sort.join
    	if groupsMap.keys.include?(sortedWord)
    		groupsMap[sortedWord] << w
    	else
    		group = Array.new
    		group << w
    		groupsMap[sortedWord] = group
    	end
    end
    return groupsMap.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
