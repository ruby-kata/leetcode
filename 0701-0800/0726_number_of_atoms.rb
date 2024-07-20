# @param {String} formula
# @return {String}
def count_of_atoms(formula)
    stack = []
    i = 0
    while i < formula.length
        c = formula[i]
        if (c >= "A" && c <= "Z") || c == ")"
            curr_element = "#{c}"
            while i + 1 < formula.length && formula[i+1] >= "a" && formula[i+1] <= "z"
                curr_element << formula[i+1]
                i += 1
            end

            curr_count = 0
            while i + 1 < formula.length && formula[i+1] >= "0" && formula[i+1] <= "9"
                curr_count = curr_count * 10 + formula[i+1].to_i
                i += 1
            end
            curr_count = 1 if curr_count < 1
            
            if c == ")"
                sub_formula = []
                until stack.empty? || stack[-1][0] == "("
                    element, count = stack.pop
                    sub_formula << [element, count * curr_count]
                end
            
                stack.pop
                stack += sub_formula
            elsif c >= "A" && c <= "Z"
                stack << [curr_element, curr_count]
            end
        elsif c == "("
            stack << [c, 0]
        end

        i += 1
    end

    counter = Hash.new {|h, k| h[k] = 0 }
    stack.each do |element, count|
        counter[element] += count
    end

    counter.entries.sort_by(&:first).map do |element, count|
        "#{element}#{count > 1 ? count : ''}"
    end.join
end
