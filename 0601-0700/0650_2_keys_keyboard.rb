# @param {Integer} n
# @return {Integer}
def min_steps(n)
    # we can write n as 2*2*2..*3*3..*5..
    # which 2,3,5... are prime factors
    # the minimum number of operators we can get that is: 2+2+2..+3+3..+5..
    # for the first 2 'A', we can get by copy&paste the init 'A' -> 2 operators
    # so we have ['AA']*2*2..*3*3..*5..
    # again, we copy&paste 'AA' -> 2 operators,
    # now we have ['AAAA']*2..*3*3..*5..
    # continue until no 2: ['AAA.....']*3*3..*5..
    # here we only paste 3 times all current 'A' on the screen -> 3 operators
    # the same as 5, we paste 5 times -> 5 operators
    # and so on ...
    count = 0
    p = 2
    while n > 1
        while n % p == 0
            count += p
            n /= p
        end
        p += 1
    end 

    count
end
