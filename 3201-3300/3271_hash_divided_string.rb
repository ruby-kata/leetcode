# @param {String} s
# @param {Integer} k
# @return {String}
def string_hash(s, k)
    s.chars.map(&:ord).each_slice(k).map { |sub|
        (97 + ((sub.sum - 97*k) % 26)).chr
    }.join
end
