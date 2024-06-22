# @param {String} word
# @return {Integer}
def wonderful_substrings(word)
    count = 0
    xor_counter = Array.new(1024, 0)
    xor_counter[0] = 1
    cur_xor = 0
    (0...word.length).each do |i|
        ci = word[i].ord - 97
        cur_xor ^= (1 << ci)
        # zero odd occurrence
        # ...cur_xor.....cur_xor
        #          [xor=0]
        count += xor_counter[cur_xor]

        # one odd occurrence
        # ...cur_xor+j.....cur_xor
        #            [xor=1]
        (0...10).each do |j|
            count += xor_counter[cur_xor ^ (1 << j)]
        end

        xor_counter[cur_xor] += 1
    end

    count
end
