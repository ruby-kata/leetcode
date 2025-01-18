# @param {Integer[]} derived
# @return {Boolean}
def does_valid_array_exist(derived)
    # assume the original is [a,b,c,d]
    # the derived will be: [(a^b),(b^c),(c^d),(d^a)]
    # hence the xor-sum (a^b^b^c^c^d^d^a) will be zero 
    derived.reduce(&:^).zero?
end
