# @param {String} moves
# @return {Boolean}
def judge_circle(moves)
    counter = moves.chars.tally
    counter['U'] == counter['D'] && counter['L'] == counter['R']
end
