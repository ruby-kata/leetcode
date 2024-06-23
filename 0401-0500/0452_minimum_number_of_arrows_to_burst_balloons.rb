# @param {Integer[][]} points
# @return {Integer}
def find_min_arrow_shots(points)
    points.sort!
    
    count = 0
    s, e = points.first
    points.each do |p|
        if e < p.first
            count += 1
            s, e = p
        else
            s = p.first if s < p.first
            e = p.last if e > p.last
        end
    end

    count + 1
end
