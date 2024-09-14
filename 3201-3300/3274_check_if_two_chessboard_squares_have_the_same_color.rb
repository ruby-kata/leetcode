# @param {String} coordinate1
# @param {String} coordinate2
# @return {Boolean}
def check_two_chessboards(coordinate1, coordinate2)
    (coordinate1[0].ord - coordinate2[0].ord).abs % 2 == (coordinate1[1].to_i - coordinate2[1].to_i).abs % 2
end
