# @param {Integer[]} bills
# @return {Boolean}
def lemonade_change(bills)
    counter = Hash.new(0)
    bills.each do |dollar|
        counter[dollar] += 1
        
        if dollar == 10
            return false if counter[5] <= 0
            counter[5] -= 1
        elsif dollar == 20
            five = 3
            if counter[10] > 0
                five -= 2
                counter[10] -= 1
            end

            return false if counter[5] < five
            counter[5] -= five
        end
    end

    true
end

# no need hash
def lemonade_change(bills)
    five = ten = 0
    bills.each { |bill|
        if bill == 5
            five += 1
        elsif bill == 10
            ten += 1
            five -= 1
        else # 20 will nerver be used for exchange
            if ten > 0
                ten -= 1
                five -= 1
            else
                five -= 3
            end
        end

        return false if five < 0        
    }

    true
end
