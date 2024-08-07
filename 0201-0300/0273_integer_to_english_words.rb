# @param {Integer} num
# @return {String}
def number_to_words(num)
    return 'Zero' if num.zero?

    map_3_digits = {
        0 => nil,
        1 => 'One',
        2 => 'Two',
        3 => 'Three',
        4 => 'Four',
        5 => 'Five',
        6 => 'Six',
        7 => 'Seven',
        8 => 'Eight',
        9 => 'Nine',
        10 => 'Ten',
        11 => 'Eleven',
        12 => 'Twelve',
        13 => 'Thirteen',
        14 => 'Fourteen',
        15 => 'Fifteen',
        16 => 'Sixteen',
        17 => 'Seventeen',
        18 => 'Eighteen',
        19 => 'Nineteen',
        20 => 'Twenty',
        30 => 'Thirty',
        40 => 'Forty',
        50 => 'Fifty',
        60 => 'Sixty',
        70 => 'Seventy',
        80 => 'Eighty',
        90 => 'Ninety',
        100 => 'One Hundred',
        200 => 'Two Hundred',
        300 => 'Three Hundred',
        400 => 'Four Hundred',
        500 => 'Five Hundred',
        600 => 'Six Hundred',
        700 => 'Seven Hundred',
        800 => 'Eight Hundred',
        900 => 'Nine Hundred',
    }

    convert_3_digits = lambda { |n|
        return map_3_digits[n] if map_3_digits.has_key?(n)

        str = []
        power = 100
        while n > 0
            if map_3_digits.has_key?(n)
                str << map_3_digits[n]
                break
            end

            r = n % power
            str << map_3_digits[n - r] if map_3_digits[n - r]
            n = r
            power /= 10
        end

        str.join(' ')
    }

    chunks_map = [nil, 'Thousand', 'Million', 'Billion', 'Trillion']

    str = []
    chunks_map.each { |name|
        if convert = convert_3_digits.call(num % 1000)
            convert += ' ' + name if name
            str.unshift(convert)
        end
        num /= 1000
        break if num <= 0
    }

    str.join(' ')
end
