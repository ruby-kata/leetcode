# @param {Integer[]} arr
# @return {Boolean}
def three_consecutive_odds(arr)
    arr.each_cons(3).any? { |x, y, z| x.odd? and y.odd? and z.odd? }
end
