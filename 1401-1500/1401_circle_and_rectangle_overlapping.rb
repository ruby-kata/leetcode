# @param {Integer} radius
# @param {Integer} x_center
# @param {Integer} y_center
# @param {Integer} x1
# @param {Integer} y1
# @param {Integer} x2
# @param {Integer} y2
# @return {Boolean}
def check_overlap(radius, x_center, y_center, x1, y1, x2, y2)
    x_closest = [x1, [x2, x_center].min].max
    y_closest = [y1, [y2, y_center].min].max
    
    d = Math.sqrt((x_closest - x_center)**2 + (y_closest - y_center)**2)
    d <= radius
end
