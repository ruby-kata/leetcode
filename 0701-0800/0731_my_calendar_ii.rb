class MyCalendarTwo
    def initialize()
        @booked = Hash.new(0)
    end

    def book(start_time, end_time)
        @booked[start_time] += 1
        @booked[end_time] -= 1

        count = 0
        @booked.keys.sort!.each { |k|
            count += @booked[k]
            if count > 2
                @booked[start_time] -= 1
                @booked[end_time] += 1
                return false
            end
        }

        true
    end
end
