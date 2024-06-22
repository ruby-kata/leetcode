$says = ["", "1"]

# @param {Integer} n
# @return {String}
def count_and_say(n)
    return $says[n] if $says[n]

    prev_say = $says[n-1] ||= count_and_say(n-1)
    
    num = prev_say[0]
    count = 0
    say = ""

    i = 0
    while i <= prev_say.size
        if prev_say[i] == num
            count += 1
        else
            say += "#{count}#{num}"
            num = prev_say[i]
            count = 1
        end
        i += 1
    end

    $says[n] = say
    say
end
