class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
    	def #{attr_name}; @#{attr_name}; end

    	def #{attr_name}= value
    		
    		# initialize if doesn't exist
				@#{attr_name}_history = [] if @#{attr_name}_history.nil?
				
				# add to history
    		@#{attr_name}_history << #{attr_name}

				# set the value itself
    		@#{attr_name} = value
    	end

    	def #{attr_name}_history; @#{attr_name}_history; end
    }
  end
end
