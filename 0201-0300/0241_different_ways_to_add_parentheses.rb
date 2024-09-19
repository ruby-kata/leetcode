# @param {String} expression
# @return {Integer[]}
def diff_ways_to_compute(expression)
    memo = Hash.new
    dfs = lambda { |exp|
        return memo[exp] if memo.has_key?(exp)

        # All the integer values in the input expression are in the range [0, 99].
        if exp.length < 3
            return [exp.to_i]
        end

        ans = []
        (0...exp.length).each { |i|
            if '-+*'.include?(exp[i])
                left = dfs.call(exp[0...i])
                right = dfs.call(exp[i+1..])
                left.each { |l|
                    right.each { |r|
                        ans << l.send(exp[i], r)
                    }
                }
            end
        }

        ans
    }

    dfs.call(expression)
end
