# @param {Integer} num_bottles
# @param {Integer} num_exchange
# @return {Integer}
def num_water_bottles(num_bottles, num_exchange)
    count = num_bottles
    remain = 0
    while num_bottles >= num_exchange
        count += (exchange = num_bottles/num_exchange)
        remain = num_bottles % num_exchange
        num_bottles = exchange + remain
    end

    count
end
