# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
    dp = Array.new(n+1) { Array.new(n+1) { nil } }
    backtrack = ->(remain_open, remain_close) {
        if (remain_open == 0 and remain_close == 0)
            return [""]
        elsif remains = dp[remain_open][remain_close]
            return remains
        else
            parenthesis = []
            if remain_open > 0
                parenthesis += backtrack.call(remain_open-1, remain_close).map do |s|
                    "(" + s
                end
            end

            if remain_open < remain_close
                parenthesis += backtrack.call(remain_open, remain_close-1).map do |s|
                    ")" + s
                end
            end
            
            dp[remain_open][remain_close] = parenthesis
            return parenthesis
        end
    }

    backtrack.call(n, n)
end
