# @param {Integer[]} students
# @param {Integer[]} sandwiches
# @return {Integer}
def count_students(students, sandwiches)
    counter = students.tally
    eaten = 0
    sandwiches.each do |s|
        return students.length - eaten if !counter.has_key?(s) or counter[s] <= 0
        
        counter[s] -= 1
        eaten += 1
    end

    0
end
