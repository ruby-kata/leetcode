# @param {String[]} details
# @return {Integer}
def count_seniors(details)
    details.count { |d| d[-4..-3].to_i > 60 }
end
