# @param {Integer[][]} items
# @param {Integer[]} queries
# @return {Integer[]}
def maximum_beauty(items, queries)
    items.sort!

    max = 0
    max_beauty = [items.first]
    items.each { |(price, beauty)|
        max = [max, beauty].max
        if max_beauty.last.first < price
            max_beauty << [price, max]
        else
            max_beauty.last[1] = max
        end
    }

    queries.map { |q|
        i = max_beauty.bsearch_index { |x| x.first > q }
        i.nil? ? max : (i > 0 ? max_beauty[i-1].last : 0)
    }
end
