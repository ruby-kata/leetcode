# @param {String} start
# @param {String} target
# @return {Boolean}
def can_change(start, target)
    l = r = 0
    while r <= target.length && l <= start.length
        r += 1 while target[r] == "_"
        l += 1 while start[l] == "_"
        return false if start[l] != target[r] || (start[l] == "R" && l > r) || (start[l] == "L" && l < r)

        r += 1
        l += 1
    end
    true
end
