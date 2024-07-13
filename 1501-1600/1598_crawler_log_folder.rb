# @param {String[]} logs
# @return {Integer}
def min_operations(logs)
    step_down = 0
    logs.each do |log|
        case log
        when "../"
            step_down -= 1
            step_down = 0 if step_down < 0
        when "./"
            # do nothing
        else
            step_down += 1
        end
    end

    step_down
end
