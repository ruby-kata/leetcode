# @param {Integer} n
# @return {Integer}
def integer_break(n)
    max = Array.new(n+1, 0)
    max[1] = 1
 
    (2..n).each do |x|
         (1...x).each do |i|
             prefix_max = max[i] >= i ? max[i] : i 
             product = prefix_max * (x - i)
             max[x] = product if max[x] < product
         end
    end
 
    max[n]
 end
 