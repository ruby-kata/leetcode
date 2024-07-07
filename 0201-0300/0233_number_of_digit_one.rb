# @param {Integer} n
# @return {Integer}
def count_digit_one(n)
    # for each current digits d
    # xx0xx0xdx00xx0xx
    #        base
    # [left ] [ right]
    #
    # when d == 1, num of 1 is:
    # [left ]100000000 + ==> ([left ]*base nums stick to d)
    #        1x00xx0xx + ==> (x00xx0xx nums stick to d)
    #        100000000   ==> (1 remain case)
    # when d > 1, num of 1 is:
    # [left ]100000000 + ==> ([left ]*base nums stick to d=1)
    #        199999999 +  ==> (99999999 nums stick to d=1)
    #        100000000   ==> (1 remain case)
    # when d == 0, num of 1 is:
    # [left ]019999999 + ==> ([left ]*base nums stick to the next d=1)
    # 

    sum = 0
    power_of_ten = 1
    while power_of_ten <= n
        right = n % power_of_ten
        left = n / (power_of_ten * 10)
        curr = (n/ power_of_ten) % 10

        left_base = left * power_of_ten 
        if curr == 1
           sum += left_base + (right + 1)
        elsif curr > 1
            sum += left_base + power_of_ten
        else
            sum += left_base
        end

        power_of_ten *= 10
    end

    sum
end
