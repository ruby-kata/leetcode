# @param {Integer[]} chalk
# @param {Integer} k
# @return {Integer}
def chalk_replacer(chalk, k)
    prefix_sums = [0]
    chalk.each { |c|
        prefix_sums << prefix_sums[-1] + c
    }

    last_round = k % prefix_sums[-1]
    prefix_sums.bsearch_index { |c| c > last_round } - 1
end
