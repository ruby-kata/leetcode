# @param {Integer} turned_on
# @return {String[]}
def read_binary_watch(turned_on)
    def backtrack_minute(hours, minutes, hour_index, minute_index, t)
        return ["#{hours}:#{sprintf('%02d', minutes)}"] if t <= 0

        result = []
        if minute_index < 6
            if (next_minute = (minutes | (1 << minute_index))) < 60
                result.concat(backtrack_minute(hours, next_minute, hour_index, minute_index + 1, t - 1))
            end
            result.concat(backtrack_minute(hours, minutes, hour_index, minute_index + 1, t))
        end

        result
    end

    def backtrack(hours, minutes, hour_index, minute_index, t)
        return ["#{hours}:#{sprintf('%02d', minutes)}"] if t <= 0

        result = []
        
        result.concat(backtrack_minute(hours, minutes, hour_index, minute_index, t))
        while hour_index < 4
            if (next_hour = (hours | (1 << hour_index))) < 12
                result.concat(backtrack(next_hour, minutes, hour_index + 1, minute_index, t - 1))
            end
            hour_index += 1
        end
        
        result
    end

    backtrack(0, 0, 0, 0, turned_on)
end
