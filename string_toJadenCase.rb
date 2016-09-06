
  def toJadenCase(str)
    array = self.split
    array.each{|x| (x << " ").capitalize!}
    array.join.chomp
  end


print toJadenCase("this is a test")
