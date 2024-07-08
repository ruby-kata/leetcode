# @param {Integer} poured
# @param {Integer} query_row
# @param {Integer} query_glass
# @return {Float}
def champagne_tower(poured, query_row, query_glass)
    return 0.0 if poured == 0

    cups = Array.new(2) { Array.new(query_row+1, 0.0) }
    cups[0][0] = poured
    curr = 0

    (0...query_row).each do |i|
        curr = 1 - curr
        (0..i).each do |j|
            if cups[1-curr][j] > 1.0
                d = (cups[1-curr][j] - 1.0) * 0.5
                cups[curr][j] += d
                cups[curr][j+1] += d
            end
            cups[1-curr][j] = 0.0
        end
    end
    
    cups[curr][query_glass] >= 1.0 ? 1.0 : cups[curr][query_glass]
end
