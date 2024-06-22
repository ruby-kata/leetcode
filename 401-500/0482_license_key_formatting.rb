# @param {String} s
# @param {Integer} k
# @return {String}
def license_key_formatting(s, k)
    license = ""
    count = 0
    (s.length-1).downto(0) do |i|
        c = s[i]
        if c != '-'
            license << ((count > 0 && count % k == 0) ? '-' : '')
            license << c.upcase
            count += 1
        end 
    end

    license.reverse
end


def license_key_formatting(s, k)
    number = (0..k).to_a.join(',')
    s = s.gsub('-','').upcase 
    s = s.reverse.scan(/.{1,#{k}}/).join('-')
    s.reverse
end


def license_key_formatting(s, k)
    s.upcase.gsub('-','').reverse.chars.each_slice(k).map(&:join).join('-').reverse
end