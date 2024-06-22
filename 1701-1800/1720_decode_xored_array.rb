# @param {Integer[]} encoded
# @param {Integer} first
# @return {Integer[]}
def decode(encoded, first)
    decoded = [first]
    x = first
    encoded.each do |num|
        decoded << (x = x ^ num)
    end

    decoded
end
