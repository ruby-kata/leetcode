# @param {String} num
# @param {Integer} k
# @return {String}
def remove_kdigits(num, k)
    nums = num.chars
    mono_stack = []
    until nums.empty?
        x = nums.shift
        if mono_stack.empty? or mono_stack.last <= x
            mono_stack.push(x)
        else
            until mono_stack.empty? or mono_stack.last <= x or k <= 0
                mono_stack.pop
                k -= 1            
            end
            mono_stack.push(x)
            break if k <= 0
        end
    end

    mono_stack += nums
    mono_stack = mono_stack[0..-k-1]
    mono_stack.shift until mono_stack.size <= 1 or mono_stack.first > "0"
    mono_stack.push(0) if mono_stack.empty?
    mono_stack.join("")
end
