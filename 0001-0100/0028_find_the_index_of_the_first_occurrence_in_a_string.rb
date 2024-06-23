# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
    return -1 if haystack.size < needle.size
    
    i = 0
    j = 0
    while i < haystack.size
        if haystack[i] == needle[j]
            i += 1
            j += 1
            return i - j if j == needle.size
        else
            i = i - j + 1
            j = 0
        end
    end
    -1
end
