# @param {Integer} n
# @return {Integer}
def total_money(n)
    week = n/7
    remain = n%7
    7*(week*(week-1))/2 + week*28 + week*remain + (remain*(remain+1))/2
end
