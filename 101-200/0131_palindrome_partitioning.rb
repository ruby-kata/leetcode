# @param {String} s
# @return {String[][]}
def partition(s)
    is_palindrome = Array.new(s.size) { Array.new(s.size, true) }
     (2..s.size).each do |len|
         i, j = 0, len-1
         while j < s.size
             is_palindrome[i][j] = s[i] == s[j] && is_palindrome[i+1][j-1]
             i += 1
             j += 1
         end
     end
 
     palindromes = Array.new(s.size) { [] }
     (s.size-1).downto(0) do |i|
         (s.size-1).downto(i) do |j|
             if is_palindrome[i][j]
                 p = [s[i..j]]
                 if j == s.size-1
                     palindromes[i].push(p)
                 else
                     palindromes[j+1].each do |x| 
                         palindromes[i].push(p + x)
                     end
                 end
             end
         end
     end
 
     palindromes[0]
 end
 