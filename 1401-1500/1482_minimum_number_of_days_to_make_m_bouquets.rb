# @param {Integer[]} bloom_day
# @param {Integer} m
# @param {Integer} k
# @return {Integer}
def min_days(bloom_day, m, k)
    return -1 if bloom_day.length < m * k

    count_can_make_bouquests = lambda { |day|
        count = 0
        needed_flowers = k
        bloom_day.each { |bday|
            if bday > day
                needed_flowers = k
            else
                needed_flowers -= 1
                if needed_flowers == 0
                    count += 1
                    needed_flowers = k
                end
            end
        }

        count
    }

    min_day = bloom_day.min
    max_day = bloom_day.max
    while min_day < max_day
        mid = (min_day + max_day)/2
        if count_can_make_bouquests.call(mid) >= m
            max_day = mid
        else
            min_day = mid + 1
        end
    end

    min_day
end
