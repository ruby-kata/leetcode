# @param {Integer[][]} events
# @return {Integer}
def button_with_longest_time(events)
    events.unshift([0,0]) # init time
    
    (1...events.size).map { |i|
        [events[i][0], events[i][1] - events[i-1][1]]
    }
    .sort { |e1, e2| e1.last == e2.last ? e2.first <=> e1.first : e1.last <=> e2.last }
    .last
    .first
end

# no need to sort
def button_with_longest_time(events)
    events.unshift([0,0]) # init time
    
    times = (1...events.size).map { |i|
        [events[i][0], events[i][1] - events[i-1][1]]
    }

    max_time = times.max_by(&:last).last
 
    times.select { |e| e.last == max_time }
    .min_by(&:first)
    .first
end