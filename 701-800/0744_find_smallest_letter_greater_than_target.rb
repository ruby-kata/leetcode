# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter(letters, target)
    letters.bsearch { |c| c > target } || letters.first
end
