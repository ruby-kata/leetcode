# @param {Integer} needed_apples
# @return {Integer}
def minimum_perimeter(needed_apples)
    # for each radius r, the additional number of apples is r*r*12    
    # so sum of apples inside a square with a side length L (r = L/2, perimeter = L*4 = r*8): 
    # = (1**2 + 2**2 + ... + r**2) * 12
    # = (r*(r+1)*(2*r+1)/6) * 12
    formular_apples_count = lambda { |r| r*(r+1)*(2*r+1)*2 }

    low = 0
    high = needed_apples
    while low < high
        m = (low + high)/2
        apples_count = formular_apples_count.call(m)

        return m * 8 if apples_count == needed_apples

        if apples_count > needed_apples
            high = m
        else
            low = m + 1
        end
    end
    
    low * 8
end
