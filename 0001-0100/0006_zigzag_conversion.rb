def convert(s, num_rows)
    return s if num_rows == 1
    
    rows = Array.new(num_rows) { "" }
    cur_row = 0
    direction = 1

    s.chars.each do |c|
        rows[cur_row] << c
        cur_row += direction
        direction *= -1 if cur_row == 0 || cur_row == num_rows-1
    end

    rows.reduce("") { |converted, row|  converted << row }
end
