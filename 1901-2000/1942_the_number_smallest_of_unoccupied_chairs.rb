# @param {Integer[][]} times
# @param {Integer} target_friend
# @return {Integer}
def smallest_chair(times, target_friend)
    chairs = Array.new(times.size, false)
    seat = Hash.new

    sorted_times = []
    times.each_with_index do |(arrive, leave), i|
        sorted_times.push([arrive, 1, i])
        sorted_times.push([leave, 0, i])
    end
    sorted_times.sort! { |t1, t2| t1[0] == t2[0] ? t1[1] - t2[1] : t1[0] - t2[0] }

    min_free_chair = 0
    sorted_times.each do |t, arrive, i|
        if arrive == 1
            seat[i] = min_free_chair
            chairs[min_free_chair] = true
            min_free_chair += 1 while chairs[min_free_chair]
        else
            min_free_chair = seat[i] if min_free_chair > seat[i]
            chairs[seat[i]] = false
        end
        return seat[i] if i == target_friend
    end
end

