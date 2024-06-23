# @param {Integer[]} alice_sizes
# @param {Integer[]} bob_sizes
# @return {Integer[]}
def fair_candy_swap(alice_sizes, bob_sizes)
    alice_sizes.sort!
    bob_sizes.sort!

    exchange_needed = (bob_sizes.sum - alice_sizes.sum) / 2
    alice_sizes.each do |x|
        ex = bob_sizes.bsearch { |y| exchange_needed <=> (y - x) }
        return [x, ex] if ex
    end

    nil
end
