# @param {String[]} deadends
# @param {String} target
# @return {Integer}
def open_lock(deadends, target)
    def increment(c)
        next_c = c.to_i + 1
        next_c = 0 if next_c > 9
        next_c.to_s
    end

    def decrement(c)
        prev_c = c.to_i - 1
        prev_c = 9 if prev_c < 0
        prev_c.to_s
    end
    
    dead = deadends.zip(Array.new(deadends.length, true)).to_h
    turns = 0
    queue = ['0000']
    until queue.empty?
        queue.size.times do
            state = queue.shift
            return turns if state == target
            next if dead.has_key?(state)

            dead[state] = true
            (0...4).each do |i|
                origin = state[i]

                state[i] = increment(state[i])
                queue << state.clone
                state[i] = origin

                state[i] = decrement(state[i])
                queue << state.clone
                state[i] = origin
            end
        end

        turns += 1
    end

    -1
end
