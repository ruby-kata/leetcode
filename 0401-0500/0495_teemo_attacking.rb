# @param {Integer[]} time_series
# @param {Integer} duration
# @return {Integer}
def find_poisoned_duration(time_series, duration)
    (time_series << Float::INFINITY).each_cons(2).inject(0) { |sum, (prev, curr)|
        sum += [(curr - prev), duration].min
    }
end
