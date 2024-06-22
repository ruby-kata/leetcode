# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
    merged = []
    min, max = new_interval
    (0...intervals.size).each do |i|
        if max < intervals[i].first
            merged << [min, max]
            merged += intervals[i..]
            return merged
        elsif min > intervals[i].last
            merged << intervals[i]
        else
            min = intervals[i].first if min > intervals[i].first
            max = intervals[i].last if max < intervals[i].last
        end
    end

    merged << [min, max]
end
