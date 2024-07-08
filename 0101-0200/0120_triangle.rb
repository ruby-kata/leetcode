# @param {Integer[][]} triangle
# @return {Integer}
def minimum_total(triangle)
    sum = Array.new(triangle.size, Float::INFINITY)
    sum[0] = 0
    triangle.each do |row|
        (row.size-1).downto(0) do |i|
            sum[i] = sum[i] + row[i]
            sum[i] = sum[i-1] + row[i] if i > 0 && sum[i] > sum[i-1] + row[i]
        end
    end
    sum.min
end
