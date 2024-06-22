# @param {Integer} sx
# @param {Integer} sy
# @param {Integer} fx
# @param {Integer} fy
# @param {Integer} t
# @return {Boolean}
def is_reachable_at_time(sx, sy, fx, fy, t)
    dx = (fx - sx).abs
    dy = (fy - sy).abs
    dmin = [dx, dy].max

    dmin == 0 ? t != 1 : dmin <= t 
end
