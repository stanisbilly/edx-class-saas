=begin
HW0 PART 2-------------------------

Define a method hello(name) that takes a string representing a name and returns the string "Hello, " concatenated with the name.

Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a consonant and false otherwise. (For our purposes, a consonant is any letter other than A, E, I, O, U.) NOTE: be sure it works for both upper and lower case and for nonletters!

Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents a binary number that is a multiple of 4. NOTE: be sure it returns false if the string is not a valid binary number!
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

def starts_with_consonant?(s)
	return false unless s.is_a? String
	return false if s.empty?
	return false if !letter?(s[0])
	vowels = ['a','e','i','o','u']
	return ! vowels.include?(s[0].downcase)
end

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
