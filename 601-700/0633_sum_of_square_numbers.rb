# 2 pointers
# @param {Integer} c
# @return {Boolean}
def judge_square_sum(c)
    l = 0
    r = Math.sqrt(c).to_i
    while l <= r
        sum = l*l + r*r
        return true if sum == c

        if sum > c
            r -= 1
        else
            l += 1
        end
    end

    false
end

# other way (slower)
def judge_square_sum(c)
    squares = Hash.new
    squares[0] = true

    (0..c).each { |num|
        num_square = num * num
        return false if num_square > c
        squares[num_square] = true
        return true if squares.has_key?(c - num_square)
    }

    false
end
