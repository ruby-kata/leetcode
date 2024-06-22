# @param {Integer[]} job_difficulty
# @param {Integer} d
# @return {Integer}
def min_difficulty(job_difficulty, d)
    min_difficulties = Array.new(job_difficulty.size) { Array.new(d, Float::INFINITY) }
    min_difficulties[job_difficulty.size-1][0] = job_difficulty[job_difficulty.size-1]

    (job_difficulty.size-2).downto(0) do |i|
        min_difficulties[i][0] = [min_difficulties[i+1][0], job_difficulty[i]].max
        (1...d).each do |k|
            max = job_difficulty[i]
            (i...job_difficulty.size-1).each do |j|
                max = [max, job_difficulty[j]].max
                min_next_day = min_difficulties[j+1][k-1]
                min_difficulties[i][k] = [min_difficulties[i][k], max + min_next_day].min
            end
        end
    end

    min_difficulties[0][d-1] == Float::INFINITY ? -1 : min_difficulties[0][d-1]
end
