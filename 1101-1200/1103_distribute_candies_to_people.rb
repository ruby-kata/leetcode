# @param {Integer} candies
# @param {Integer} num_people
# @return {Integer[]}
def distribute_candies(candies, num_people)
    one_to_n = (num_people * (num_people + 1))/2
    sum = 0
    round = 0
    loop do
        next_sum = sum + num_people * num_people * round + one_to_n
        break if next_sum > candies

        sum = next_sum
        round += 1
    end

    distributes = if round > 0 then
        r = ((round * (round-1))/2) * num_people
        (1..num_people).map { |i| r + i * round }
    else
        Array.new(num_people, 0)
    end

    return distributes if sum == candies

    distribute_last_round = round > 0 ? round * num_people : 0
    i = 0 
    loop do
        d = distribute_last_round + i + 1
        if sum + d >= candies
            distributes[i] += candies - sum
            break
        else
            distributes[i] += d
            sum += d
            i += 1
        end
    end

    distributes
end
