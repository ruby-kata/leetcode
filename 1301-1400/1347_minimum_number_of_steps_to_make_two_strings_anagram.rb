# @param {String} s
# @param {String} t
# @return {Integer}
def min_steps(s, t)
    count = s.size
    s_counter = s.chars.tally
    t.chars.tally.each do |c, len|
        count -= [s_counter[c], len].min if s_counter.key?(c)
    end

    count
end
