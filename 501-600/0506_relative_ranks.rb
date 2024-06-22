# @param {Integer[]} score
# @return {String[]}
def find_relative_ranks(score)
    rankes = score.sort.reverse.map.with_index do |s, i|
        rank = \
            case i
            when 0
                "Gold Medal"
            when 1
                "Silver Medal"
            when 2
                "Bronze Medal"
            else
                (i + 1).to_s
            end

        [s, rank]
    end.to_h

    score.map do |s|
        rankes[s]
    end
end
