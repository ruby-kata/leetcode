# @param {Integer} n
# @param {Integer[]} left
# @param {Integer[]} right
# @return {Integer}
def get_last_moment(n, left, right)
    # imaging that both A & B do not change direction when they collised but change their name together
    #   A -><- B
    # <-B      A->   
    #
    [left.max || 0, n - (right.min || n)].max
end
