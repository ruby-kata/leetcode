# @param {Integer[][]} customers
# @return {Float}
def average_waiting_time(customers)
    sum = 0
    curr_time = 0
    customers.each do |(start_time, duration)|
        curr_time = [start_time, curr_time].max + duration
        sum += curr_time - start_time
    end

    sum.to_f/customers.length
end
