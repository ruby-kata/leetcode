# @param {Integer[][]} image
# @return {Integer[][]}
def flip_and_invert_image(image)
    image.map do |row|
        row.reverse.map { |x| 1 - x }
    end
end
