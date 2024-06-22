# @param {Integer[]} seats
# @param {Integer[]} students
# @return {Integer}
def min_moves_to_seat(seats, students)
    seats.sort!
    students.sort!
    (0...seats.length).inject(0) { |sum, i|
        sum += (seats[i] - students[i]).abs
    }
end
