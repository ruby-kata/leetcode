class UnionZeroSet
    attr_reader :set

    def initialize(n)
        @set = (0...n).to_a
    end

    def find(x)
        @set[x] = find(@set[x]) if @set[x] != x
        @set[x]
    end

    def union(x, y)
        _x = find(x)
        _y = find(y)

        if _x == 0
            @set[_y] = 0
        elsif _y == 0
            @set[_x] = 0
        else
            @set[_x] = _y
        end
    end

    def reset(x)
        @set[x] = x
    end

    def zero_set
        zeros = []
        @set.each_with_index do |x, i|
            zeros << i if x == 0
        end

        zeros
    end
end

# @param {Integer} n
# @param {Integer[][]} meetings
# @param {Integer} first_person
# @return {Integer[]}
def find_all_people(n, meetings, first_person)
    union_zero_set = UnionZeroSet.new(n)
    union_zero_set.union(0, first_person)

    shared = Hash.new { |h, k| h[k] = [] }
    meetings.each do |(x, y, t)|
        shared[t] << [x, y]
    end

    shared.sort_by(&:first).each do |(t, arr)|
        arr.each do |(x, y)|
            union_zero_set.union(x, y)
        end

        arr.each do |(x, y)|
            if union_zero_set.find(x) != 0
                union_zero_set.reset(x) 
                union_zero_set.reset(y)
            end
        end
    end

    union_zero_set.zero_set
end
