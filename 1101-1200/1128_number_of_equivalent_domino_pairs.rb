# @param {Integer[][]} dominoes
# @return {Integer}
def num_equiv_domino_pairs(dominoes)
    count = 0
    counter = Hash.new(0)
    dominoes.each do |d|
        d.sort!
        count += counter[d]
        counter[d] += 1
    end

    count
end
