# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
    counter = tasks.tally.values
    max_frequency = counter.max
    # this arrangement is the minimum way
    arrangement = \
        # arranging others (and maybe `idle`) into each n places between max_frequency-1 the max frequency tasks
        (max_frequency - 1) * (n + 1) +
        # append all the last one of all the tasks which have same max_frequency
        counter.count(max_frequency)

    # If the length of tasks >= the above arrangement,
    # then it means there's enough tasks for this arrangement and no need any idle time, 
    # and you could fair distribute the rest tasks into between the max frequency tasks in the above arrangement,
    # that still satisfy the requirement since no one in the rest tasks have frequency > the max frequency.
    # Otherwise, there's not enough tasks for the above arrangement (and need idle times).
    tasks.length >= arrangement ? tasks.length : arrangement
end
