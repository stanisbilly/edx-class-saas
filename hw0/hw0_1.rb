=begin
HW0 PART 1-------------------------

Define a method sum which takes an array of integers as an argument and returns the sum of its elements. For an empty array it should return zero.

Define a method max_2_sum which takes an array of integers as an argument and returns the sum of its two largest elements. For an empty array it should return zero. For an array with just one element, it should return that element.

Define a method sum_to_n? which takes an array of integers and an additional integer, n, as arguments and returns true if any two distinct elements in the array of integers sum to n. An empty array or single element array should both return false.
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
