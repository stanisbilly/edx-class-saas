=begin
HW0 PART 1-------------------------
Define a method sum wich takes an arr of ints as an arg and returns sum of its elems. For an emtpy arr it should return 0.

Define a method max_2_sum, which takes an arr of ints as an arg and returns the sum of its two largest elems. For an emtpy arr it should return 0. For an arr with just one elem, it should return that elem.

Define a method, sum_to_n? which takes an arr of ints and an additonal int, n, as args and returns true if any of two distinct elems int the arr of ints sum to n. An empty arr or single elem arr should both return false.
=end

def sum(nums)
	sum = 0
	if(nums.is_a? Array)
		if(nums.empty?)
			return 0
		else
			nums.each do |n|
				if(n.is_a? Integer)
					sum += n
				else
					return 0
				end
			end
			return sum
		end
	else
		return 0
	end
end

def testSum
	puts sum([]) == 0
	puts sum(1) == 0
	puts sum([1,1,1,1,1,1,1,1,1,1]) == 10
	puts sum([1,2,3,4,5]) == 15
end

def max_2_sum(nums)
	if(nums.is_a? Array)
		if(nums.empty?)
			return 0
		elsif(nums.length == 1)
			return nums[0]
		else
			max = nums[0]
			max2 = nums[1]
			(2..nums.length-1).each do |i|
				if(nums[i].is_a? Integer)
					if(nums[i] > max)						
						max2 = max
						max = nums[i]
					elsif(nums[i] > max2)
						max2 = nums[i]
					end
					puts "#{max}, #{max2}"
				else
					return 0
				end
			end
			return max + max2
		end
	else
		return 0
	end
end

def testMax_2_sum
	puts max_2_sum([]) == 0
	puts max_2_sum([1]) == 1
	puts max_2_sum([1,2,3,4,5]) == 9
	puts max_2_sum([1,-2,-3,-4,-5]) == -1
end
	
def sum_to_n?(nums,	sum)
	if(nums.empty? || nums.length == 1)
		return false
	else
		startIndex = 0		
		startIndex.upto(nums.length-1) do |i|
			(startIndex+1).upto(nums.length-1) do |j|
				if(nums[startIndex] + nums[j]) == sum
					return true
				end
			end
			startIndex += 1
		end
		return false
	end
end

def testSum_to_n
	puts sum_to_n?([],0) == false
	puts sum_to_n?([1],0) == false
	puts sum_to_n?([1,2,3,4,5], 20) == false
	puts sum_to_n?([1,2,3,4,5], 6) == true
	puts sum_to_n?([1,2,3,4,5], 2) == false
end

#testSum
#testMax_2_sum
#testSum_to_n

=begin
HW0 PART 2-------------------------
Define a method hello(name) that takes a string representing a name and returns the string "Hello," concatenated with the name.

Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a consonant and false otherwise. (A consonant is a letter other than AEIOU). NOTE: Be sure it works for both upper and lower case and for nonletters!

Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents a binary num that is a multiple of 4. NOTE: be sure it returns false if the string is not a valid binary num!
=end

def letter?(s)
	s =~ /[A-Za-z]/
end

def number?(n)
	n =~ /[0-9]/
end

def hello(name)
	"Hello, " + name
end

#puts hello("Test")

def starts_with_consonant?(s)
	return false unless s.is_a? String
	return false if s.empty?
	return false if !letter?(s[0])
	vowels = ['a','e','i','o','u']
	return ! vowels.include?(s[0].downcase)
end

def testStart_with_consonant
	puts starts_with_consonant?(1) == false
	puts starts_with_consonant?([1]) == false
	puts starts_with_consonant?("test") == true
	puts starts_with_consonant?("TEST") == true
	puts starts_with_consonant?("aEiOu") == false
	puts starts_with_consonant?("#foo") == false
end

#testStart_with_consonant

def binary_multiple_of_4?(s)
	return false unless s.is_a? String
	return false if s.empty?
	i = 0
	sum = 0
	s = s.reverse
	(0..s.length-1).each do |n|
		if((s[n]!="0") && (s[n]!="1"))
			return false
		elsif(s[n]=="1")
			sum += (2**i)
		end
		#puts "#{s[n]},#{sum} "
		i += 1
	end
	(sum%4 == 0) ? (return true) : (return false)
end

def testBinary_multiple_of_4
	puts binary_multiple_of_4?(4) == false
	puts binary_multiple_of_4?([1,2,3]) == false
	puts binary_multiple_of_4?("0") == true
	puts binary_multiple_of_4?("10") == false
	puts binary_multiple_of_4?("") == true
	puts binary_multiple_of_4?("100000000000001") == false
	puts binary_multiple_of_4?("111110100") == true
	puts binary_multiple_of_4?("4312432152") == false
end

#testBinary_multiple_of_4

=begin
HW0 PART 3-------------------------
Define a class BookInStock which represents a book with an isbn number, isbn, and a price of the book as a floating-pt num, price, as attrs. The constructor should accept the ISBN num (a str) as the first arg and price as second arg, and should raise ArgumentError if the ISBN num is the empty string or if the price is <= 0.

Include the proper getters and setters for these attrs. Include a method price_as_string that returns the price of the book with a leading dollar sign and trailing zeros (eg. price of 20 should display as "$20.00" and price of 33.8 should return "$33.80". 
=end

class BookInStock
	attr_accessor :isbn, :price
	
	def initialize(isbn, price)		
		raise ArgumentError.new("ISBN is empty") if isbn.empty?
		raise ArgumentError.new("Price has to be more than 0") if price <= 0
		@isbn = isbn
		@price = price
	end
	
	def price_as_string
		return "$#{"%.2f"% @price}"
	end
end

def testBookInStock
	book1 = BookInStock.new("1343243", 20)
	puts book1.price_as_string
	book2 = BookInStock.new("1234325", 20.8)
	puts book2.price_as_string
	book2 = BookInStock.new("", 20)
	book3 = BookInStock.new("123", 0)
	book4 = BookInStock.new("123", -1)
	book5 = BookInStock.new("", -1)
end

#testBookInStock



