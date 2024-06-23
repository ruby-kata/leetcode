# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
    steps1 = steps2 = 1
    steps = 1

    (n-2).downto(0) do |i|
        steps = steps1 + steps2
        steps2 = steps1
        steps1 = steps
    end

    steps
end
