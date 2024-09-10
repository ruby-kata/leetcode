# @param {Integer[][]} intervals
# @return {Integer[]}
def find_right_interval(intervals)
    sorted_intervals = intervals.map.with_index { |(s, e), i| [s, e, i] }.sort!
    (0...intervals.size).map { |i|
        sorted_intervals.bsearch { |_interval| _interval[0] >= intervals[i][-1] }&.last || -1
    }
end
