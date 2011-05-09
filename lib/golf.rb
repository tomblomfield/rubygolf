class Golf
  
  def self.hole1(a)
    a.reduce(1, :*)
  end
  
  def self.hole6(a)
    (1..a).each.map{|e| e%15 == 0 ? "fizzbuzz" : (e%5 == 0 ? "buzz" : (e%3 == 0 ? "fizz" : e)) }
  end
  
  def self.hole7(a)
    a.reduce([[]]) {|m,e| m[-1][-1] == e-1 ? m[-1] << e : m << [e]; m}[1..-1].map{|a| a.length == 1 ? a[0].to_s : "#{a[0]}-#{a[-1]}"}    
  end
end