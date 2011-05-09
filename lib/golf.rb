class Golf
  
  class << self
  
    def hole1(a)
      a.reduce(1, :*)
    end
  
    def hole6(a)
      (1..a).each.map{|e| e%15 == 0 ? "fizzbuzz" : (e%5 == 0 ? "buzz" : (e%3 == 0 ? "fizz" : e)) }
    end
  
    def hole7(a)
      a.reduce([[]]) {|m,e| m[-1][-1] == e-1 ? m[-1] << e : m << [e]; m}[1..-1].map{|a| a.length == 1 ? a[0].to_s : "#{a[0]}-#{a[-1]}"}    
    end
    
    def hole4(a)                                                                  
        a.map do |b|                                                                     
          b = "hat(#{b})" if b =~ /man/                                                  
          b.sub!(')', '(bone))') if b =~ /dog/                                           
          b.gsub!(/cat/,'dead')                                                          
          b                                                                              
        end                                                                              
      end                                                                                

      def hole8(a)                                                                  
        n(a,1,0)                                                                         
      end                                                                                

      def n(c,a,b)                                                                  
        [a] + (c > 1 ? n(c-1,a+b,a) : [])                                                
      end  

      def hole9(a)                                                                                                                                                                                           
        ll = []                                                                          
        v = File.read(a).split("\n").map{|s| s.split(', ')}                                
        x = 1                                                                              
        while x <= v.map(&:size).max                                                       
          r, c, l, s = f(v,x, ll)                                                          
          return r if c > (v.size / 2)                                                     
          ll << l                                                                          
          x += 1                                                                           
        end                                                                              
        return r                                                                         
      end                                                                                

      def f v, l, ll                                                                
        r = {}                                                                           
        v.each do |d|                                                                    
          v = g(0,d, l, ll)                                                              
          r[v] ||= 0                                                                     
          r[v] += 1                                                                      
        end                                                                              
        r = r.sort_by(&:last)                                                            
        r.last + r.first                                                                 
      end                                                                                

      def g(n, d, l, ll)                                                            
        return d[n] unless ll.include?(d[n])                                             
        return nil if n >= l                                                             
        g(n+1, d, l, ll)                                                                 
      end
      
      def hole3 n
           n > 1 ? n*hole3(n-1) : 1
         end

         def hole5 n
           l=n.length
           r=[]
           0.upto(l-1) {|i|
             i.upto(l) {|j|
               r << n[i..j]
             }
           }
           r.uniq.sort{|a,b| (a.length<=>b.length)*2+(a<=>b) }
         end
         
         def hole2(line)
           list = line.split(' ')
           sorted_second_char_list = list.map{|elem| elem[1..elem.length]}.sort

           sorted_hash = Hash.new
           sorted_second_char_mapping = list.map{|elem| sorted_hash[elem[1..elem.length]] = elem}.sort

           return_array = []
           for elem in sorted_second_char_list
             return_array << sorted_hash[elem]
           end

           return return_array.join(" ")
         end

  end
  
  
  
end


