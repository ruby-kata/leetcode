# binary-search
def arrange_coins(n)
    return 1 if n == 1
    
    lo = 1
    hi = n
    while lo < hi
       mid = (lo + hi) >> 1
       sum = (mid * (mid + 1))/2
 
       return mid if sum == n
       if sum > n
          hi = mid
       else
          lo = mid + 1
       end
    end
 
    lo - 1
end

# math 
def arrange_coins(n)
    (Math.sqrt(2*n + 0.25) - 0.5).floor
end
