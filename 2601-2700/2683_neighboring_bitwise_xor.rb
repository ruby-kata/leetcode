# @param {Integer[]} derived
# @return {Boolean}
def does_valid_array_exist(derived)
    derived.reduce(&:^).zero?
end
