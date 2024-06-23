# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
    ans = []
    backtrack = lambda { |start, com|
        return ans.push(com.clone) if com.size == k

        (start..n).each do |i|
            com.push(i)
            backtrack.call(i+1, com)
            com.pop
        end
    }

    backtrack.call(1, [])
    ans
end

def combine(n, k)
    (1..n).to_a.combination(k).to_a
end
