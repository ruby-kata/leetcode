# @param {Integer[][]} img
# @return {Integer[][]}
def image_smoother(img)
    def min(a, b) = a < b ? a : b
    def max(a, b) = a > b ? a : b

    rows = img.size
    cols = img[0].size
    
    (0...rows).map do |i|
        (0...cols).map do |j|
            sub_arr = img[max(0, i-1)..min(rows-1, i+1)].map {|r| r[max(0, j-1)..min(cols-1, j+1)]}.flatten
            sub_arr.sum / sub_arr.size
        end
    end 
end
