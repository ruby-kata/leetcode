# @param {String[]} folder
# @return {String[]}
def remove_subfolders(folder)
    folder.sort_by!(&:size)

    parent = Hash.new
    folder.reject { |f|
        parts = f.split("/")
        removed = false
        (0...parts.size).each { |i|
            if parent.has_key?(parts[0..i])
                removed = true
                break
            end
        }
        parent[parts] = true
        removed
    }
end
