# @param {Integer[]} mountain
# @return {Integer[]}
def find_peaks(mountain)
    (1...mountain.length-1).select { |i|
        mountain[i] > mountain[i-1] && mountain[i] > mountain[i+1]
    }
end
