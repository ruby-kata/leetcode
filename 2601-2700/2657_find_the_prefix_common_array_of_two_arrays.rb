# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer[]}
def find_the_prefix_common_array(a, b)
    counter_a = Hash.new
    counter_b = Hash.new
    ans = Array.new(a.length+1, 0)
    (0...a.length).each { |i|
        ans[i+1] = ans[i]
        
        if !counter_a.has_key?(a[i]) && counter_b.has_key?(a[i])
            ans[i+1] += 1
        end

        if !counter_b.has_key?(b[i]) && counter_a.has_key?(b[i])
            ans[i+1] += 1
        end

        if !counter_a.has_key?(a[i]) && !counter_b.has_key?(b[i]) && a[i] == b[i]
            ans[i+1] += 1
        end

        counter_a[a[i]] = true
        counter_b[b[i]] = true
    }

    ans[1..]
end
