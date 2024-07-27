# @param {String[]} names
# @param {Integer[]} heights
# @return {String[]}
def sort_people(names, heights)
    names.zip(heights).sort_by(&:last).map(&:first).reverse
end
