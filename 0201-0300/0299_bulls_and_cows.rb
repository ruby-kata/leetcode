# @param {String} secret
# @param {String} guess
# @return {String}
def get_hint(secret, guess)
    bulls = 0
    cows = 0
    secret_appear = Hash.new(0)
    guess_appear = Hash.new(0)

    (0...secret.size).each do |i|
        if secret[i] == guess[i]
            bulls += 1
        else
            if secret_appear[guess[i]] > 0
                cows += 1
                secret_appear[guess[i]] -= 1
            else
                guess_appear[guess[i]] += 1
            end

            if guess_appear[secret[i]] > 0
                cows += 1
                guess_appear[secret[i]] -= 1
            else
                secret_appear[secret[i]] += 1
            end
        end
    end

    "#{bulls}A#{cows}B"
end
