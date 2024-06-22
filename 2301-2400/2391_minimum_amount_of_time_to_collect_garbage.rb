# @param {String[]} garbage
# @param {Integer[]} travel
# @return {Integer}
def garbage_collection(garbage, travel)
    tm, tp, tg = 0, 0, 0
    gcollect = garbage[0].size
    tsum = 0 
    travel.each.with_index do |t, i|
        tsum += t
        gcollect += garbage[i+1].size
        tm = tsum if garbage[i+1].index("M")
        tp = tsum if garbage[i+1].index("P")
        tg = tsum if garbage[i+1].index("G")
    end

    gcollect + tm + tp + tg
end
