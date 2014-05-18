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
