# @param {Integer[][]} books
# @param {Integer} shelf_width
# @return {Integer}
def min_height_shelves(books, shelf_width)
    # defining dp[i] as the min height for placing i books (IN ORDER)
    dp = Array.new(books.size + 1, Float::INFINITY)
    dp[0] = 0
    (0...books.size).each { |i|
        # for the next i-th book
        w, h = books[i]
        # we can:
        # place it on another level
        dp[i+1] = dp[i] + h
        # collect books [j..i-1] and place them at the same level, 0 <= j < i
        (i-1).downto(0) { |j|
            w += books[j][0]
            # Note that we need to place books IN ORDER
            # so we cannot place the i-th book at the same level of books [j..i-2] which above the (i-1)th book
            # therefor, if the width of books [j..i] is out of the shelf width, we stop
            break if w > shelf_width

            h = [h, books[j][1]].max
            dp[i+1] = [dp[i+1], dp[j] + h].min
        }
    }

    dp[books.size]
end
