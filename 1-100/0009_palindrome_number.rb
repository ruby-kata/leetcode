def is_palindrome(x)
    return false if x < 0

    reverse = 0
    cp_x = x
    while x != 0
        reverse = reverse * 10 + x % 10
        x = x / 10
    end

    reverse == cp_x
end
