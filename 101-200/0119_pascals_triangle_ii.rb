# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
    pascal_row = Array.new(row_index+1, 1)
    (2..row_index).each do |i|
        (i-1).downto(1) do |j|
            pascal_row[j] += pascal_row[j-1]
        end
    end

    pascal_row
end
