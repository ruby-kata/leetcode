# @param {String} s
# @param {Integer} k
# @return {String}
def get_encrypted_string(s, k)
    s.chars.rotate(k).join
end
