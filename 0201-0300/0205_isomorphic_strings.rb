# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
    smap = Hash.new
    tmap = Hash.new
    (0...s.length).each do |i|
        return false if (smap.has_key?(s[i]) && smap[s[i]] != t[i]) || (tmap.has_key?(t[i]) && tmap[t[i]] != s[i])

        smap[s[i]] = t[i]
        tmap[t[i]] = s[i]
    end

    true
end
