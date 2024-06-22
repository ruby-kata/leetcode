# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
    v1 = version1.split(".")
    v2 = version2.split(".")
    max_len = [v1.length, v2.length].max

    i = 0
    while i < max_len
        r = v1[i].to_i <=> v2[i].to_i
        return r if r != 0
        i += 1
    end

    0
end
