# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
    lo = 0
    hi = x
    while lo <= hi
        mid = (lo + hi) / 2
        square = mid * mid
        if square == x
            return mid
        elsif square > x
            hi = mid - 1
        else
            lo = mid + 1
        end
    end

    lo < hi ? lo : hi
end
