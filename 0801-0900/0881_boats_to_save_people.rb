# @param {Integer[]} people
# @param {Integer} limit
# @return {Integer}
def num_rescue_boats(people, limit)
    people.sort!

    count = 0
    i = 0
    j = people.length-1
    while j >= i
        i += 1 if people[i] + people[j] <= limit
        j -= 1
        count += 1
    end

    count
end
