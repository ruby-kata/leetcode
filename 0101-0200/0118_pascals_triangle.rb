# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
    pascal = []
    pascal[0] = [1]
    (1...num_rows).each do |i|
        pascal[i] = [1]
        (1...i).each do |j|
            pascal[i][j] = pascal[i-1][j-1] + pascal[i-1][j]
        end
        pascal[i].push(1)
    end

    pascal
end
