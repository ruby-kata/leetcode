Roman_To_Int = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000,
}

# @param {String} s
# @return {Integer}
def roman_to_int(s)
    sum = 0
    prev = 0
    s.chars.reverse.each do |c|
        i = Roman_To_Int[c]
        sum += i >= prev ? i : -i
        prev = i
    end

    sum
end
