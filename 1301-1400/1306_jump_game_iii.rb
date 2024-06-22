# @param {Integer[]} arr
# @param {Integer} start
# @return {Boolean}
def can_reach(arr, start)
    visited = Array.new(arr.length, false)
    queue = [start]
    while queue.size > 0
        pos = queue.shift
        next if visited[pos]
        return true if arr[pos].zero?

        visited[pos] = true
        left, right = pos - arr[pos], pos + arr[pos]
        queue.push(left) if left >= 0
        queue.push(right) if right < arr.size
    end
    false
end
