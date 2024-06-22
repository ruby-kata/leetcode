# @param {Integer} n
# @param {Integer[][]} logs
# @return {Integer}
def hardest_worker(n, logs)
    min_id = n
    max_time = 0
    prev_leave_time = 0

    logs.each do |(id, leave_time)|
        work_time = leave_time - prev_leave_time
        if max_time <= work_time
            min_id = id if max_time < work_time || min_id > id
            max_time = work_time
        end
        prev_leave_time = leave_time
    end

    min_id
end
