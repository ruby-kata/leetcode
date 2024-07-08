# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
    ans = Array.new(temperatures.size, 0)
    mono_stack = []
    (temperatures.size-1).downto(0) do |i|
        until mono_stack.empty? || temperatures[mono_stack.last] > temperatures[i]
            mono_stack.pop
        end
        ans[i] = mono_stack.last - i unless mono_stack.empty?
        mono_stack.push(i)
    end

    ans
end
