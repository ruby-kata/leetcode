# @param {Integer[]} group_sizes
# @return {Integer[][]}
def group_the_people(group_sizes)
    sizes = Hash.new { |h, k| h[k] = [] }
    group_sizes.each_with_index do |s, i|
        sizes[s].push(i)
    end

    groups = []
    sizes.each do |s, people|
        people.each_slice(s) do |g|
            groups.push(g)
        end
    end

    groups
end
