# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
    dependent_courses = Array.new(num_courses) { [] }
    prerequisites.each do |course, require_course|
        dependent_courses[require_course] << course
    end

    require_counter = Array.new(num_courses) { 0 }
    dependent_courses.each_with_index do |d_courses, r_course|
        d_courses.each do |dc|
            require_counter[dc] += 1
        end
    end

    queue = []
    require_counter.each_with_index do |count, index|
        queue << index if count == 0
    end

    taked_courses = 0
    until queue.empty?
        course = queue.shift
        dependent_courses[course].each do |course_index|
            require_counter[course_index] -= 1
            queue << course_index if require_counter[course_index] == 0
        end

        taked_courses += 1 
    end

    taked_courses == num_courses
end
