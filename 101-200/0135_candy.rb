# @param {Integer[]} ratings
# @return {Integer}
def candy(ratings)
    distribute = Array.new(ratings.size, 1)
    
    (0...ratings.size-1).each do |i|
        distribute[i+1] = distribute[i] + 1 if ratings[i+1] > ratings[i]
    end

    (ratings.size-1).downto(1) do |j|
        if ratings[j-1] > ratings[j]
            distribute[j-1] = distribute[j] + 1 if distribute[j-1] < distribute[j] + 1
        end
    end

    distribute.sum
end
