class Dessert
	attr_accessor :name, :calories
  def initialize(name, calories)
  	@name, @calories = name, calories
  end
  def healthy?
    self.calories < 200
  end
  def delicious?
    true
  end
end

class JellyBean < Dessert
	attr_accessor :flavor
  def initialize(flavor)
    @flavor, @calories, @name = flavor, 5, "#{flavor} jelly bean"
  end
  def delicious?
  	self.flavor != "licorice"
	end
end
