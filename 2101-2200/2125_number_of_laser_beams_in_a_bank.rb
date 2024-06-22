# @param {String[]} bank
# @return {Integer}
def number_of_beams(bank)
    bank.map { |r| r.count('1') }
        .reject(&:zero?)
        .each_cons(2).sum { |prev, curr| prev * curr }
end
