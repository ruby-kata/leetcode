PhoneChars = [
    nil, nil,
    "abc".split(""),
    "def".split(""),
    "ghi".split(""),
    "jkl".split(""),
    "mno".split(""),
    "pqrs".split(""),
    "tuv".split(""),
    "wxyz".split("")
]

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
    return [] if digits.empty?
    
    digits.split("").reduce([""]) do |combinations, d|
        combinations = combinations.flat_map do |com|
            PhoneChars[d.to_i].map do |c|
                com + c
            end
        end
    end
end
