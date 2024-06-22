# @param {String} text
# @param {String} first
# @param {String} second
# @return {String[]}
def find_ocurrences(text, first, second)
    arr = text.split(" ")
    matches = []
    (0..arr.length-3).each do |i|
        matches << arr[i+2] if arr[i] == first && arr[i+1] == second
    end
    
    matches
end
