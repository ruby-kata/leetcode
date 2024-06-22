MOD = 1000000007

# @param {Integer} n
# @return {Integer}
def num_prime_arrangements(n)
    def sieve_of_eratosthenes(n)
        sieve = Array.new(n+1, true)
        sieve[0] = sieve[1] = false
        (2..n).each do |i|
            next if (!sieve[i])
            j = 2 * i
            while j <= n
                sieve[j] = false
                j += i
            end
        end

        sieve.filter { |x| x == true }.count
    end

    def factorial(n)
        return 1 if n <= 1
        (n * factorial(n-1)) % MOD
    end

    prime_count = sieve_of_eratosthenes(n)
    not_prime_count = n - prime_count
    (factorial(prime_count) * factorial(not_prime_count)) % MOD
end
