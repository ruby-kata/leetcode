class RandomizedSet
    def initialize()
        @value_indexes = {}
        @values = []
    end

    def insert(val)
        return false if @value_indexes.has_key?(val)

        @values.push(val)
        @value_indexes[val] = @values.size-1

        true
    end

    def remove(val)
        return false unless @value_indexes.key?(val)

        value_index = @value_indexes.delete(val)
        if value_index < @values.size-1
            @values[value_index] = @values.pop
            @value_indexes[@values[value_index]] = value_index
        else
            @values.pop
        end

        true
    end

    def get_random()
        random_index = rand(0...@values.size)
        @values[random_index]
    end
end
