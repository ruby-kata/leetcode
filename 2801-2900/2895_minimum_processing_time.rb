# @param {Integer[]} processor_time
# @param {Integer[]} tasks
# @return {Integer}
def min_processing_time(processor_time, tasks)
    tasks.sort!.reverse!
    processor_time.sort!.map.with_index { |t, i|
        t + tasks[i * 4]
    }.max
end
