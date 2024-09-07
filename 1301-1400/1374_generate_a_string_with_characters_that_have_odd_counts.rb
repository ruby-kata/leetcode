# @param {Integer} n
# @return {String}
def generate_the_string(n)
    'q' * (n-1) + (n.odd? ? 'q' : 'a')
end
