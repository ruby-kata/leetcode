# @param {String[][]} paths
# @return {String}
def dest_city(paths)
    dest = Hash.new
    paths.each do |f, t|
        dest[f] = t
        dest[t] ||= nil
    end

    dest.find {|k, v| v.nil? }.first
end
