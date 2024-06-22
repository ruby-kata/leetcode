FIX_MAX = 2147483647 
FIX_MIN = -2147483648

def reverse(x)
    return 0 if x <= FIX_MIN || x > FIX_MAX + 1

    sign = x < 0 ? -1 : 1;
    x = x.abs
    reverser = 0
    while x > 0
        reverser = (reverser * 10) + (x % 10)
        x = x / 10
    end

    reverser = reverser * sign;
    reverser >= FIX_MIN && reverser <= FIX_MAX ? reverser : 0;
end
