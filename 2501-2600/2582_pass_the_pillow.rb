# @param {Integer} n
# @param {Integer} time
# @return {Integer}
def pass_the_pillow(n, time)
    size = n - 1
    index = time % size
    index = (time/size).odd? ? size - index : index
    index + 1
end
