# @param {String} n
# @return {String}
def nearest_palindromic(n)
    pals = []
 
    if n[0] == '1' # case 100 -> 99
        pals << ((10 ** (n.size-1)) - 1)
    elsif n[0] == '9' # case 99 -> 101
        pals << ((10 ** n.size) + 1)
    end

    # we only need to check the half left of n
    # since when we concat half-left and half-left-reverse, we get a palindromic
    # now we could prove that the min palindromic is in the range [half-left-1..half-left+1]: 
    # ...[half-left - 1]+[reverse]...n...[half-left + 1][reverse]...
    # let x < half-left - 1 then x + x-reverse will smaller than [half-left - 1]+[reverse], hence the distance to n will larger
    # let x > half-left + 1 then x + x-reverse will larger than [half-left + 1]+[reverse], hence the distance to n will larger
    half_i = n[0...((n.size+1)/2)].to_i
    (half_i-1..half_i+1).each { |half|
        half_s = half.to_s
        pals << (half_s + half_s[0..(n.size.odd? ? -2 : -1)].reverse).to_i
    }

    num = n.to_i
    min = Float::INFINITY
    min_pal = Float::INFINITY
    pals.each { |pal|
        diff = (num - pal).abs
        if diff > 0 && (min > diff || (min == diff && min_pal > pal))
            min = diff
            min_pal = pal
        end
    }

    min_pal.to_s
end
