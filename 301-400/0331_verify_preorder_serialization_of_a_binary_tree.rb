# @param {String} preorder
# @return {Boolean}
def is_valid_serialization(preorder)
    degree = 1
    preorder.split(",").each do |c|
        degree -= 1
        return false if degree < 0

        degree += 2 if c != "#"
    end

    degree == 0
end
