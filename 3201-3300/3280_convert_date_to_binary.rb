# @param {String} date
# @return {String}
def convert_date_to_binary(date)
    date.split('-').map { |d| d.to_i.to_s(2) }.join('-')
end
