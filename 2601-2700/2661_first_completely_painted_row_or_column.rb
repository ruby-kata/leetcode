# @param {Integer[]} arr
# @param {Integer[][]} mat
# @return {Integer}
def first_complete_index(arr, mat)
    index_hash = arr.map.with_index { |x, i| [x, i] }.to_h
    
    rows = mat.size
    cols = mat[0].size

    max_row_indexs = Array.new(rows, 0)
    max_col_indexs = Array.new(cols, 0)

    (0...rows).each { |r|
        (0...cols).each { |c|
            index = index_hash[mat[r][c]]
            max_row_indexs[r] = [max_row_indexs[r], index].max
            max_col_indexs[c] = [max_col_indexs[c], index].max
        }
    }

    [max_row_indexs.min, max_col_indexs.min].min
end

# optimize 
def first_complete_index(arr, mat)
    indexes_hash = {}
    rows = mat.size
    cols = mat[0].size
    (0...rows).each { |r|
        (0...cols).each { |c|
            indexes_hash[mat[r][c]] = [r, c]
        }
    }

    row_count = Array.new(rows, 0)
    col_count = Array.new(cols, 0)
    arr.each_with_index { |x, i|
        r, c = indexes_hash[x]
        return i if (row_count[r] += 1) >= cols || (col_count[c] += 1) >= rows
    }
end
