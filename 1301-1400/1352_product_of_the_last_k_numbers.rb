class ProductOfNumbers
    def initialize()
        @products = [1]
    end

    def add(num)
        if num.zero?
            @products = [1]
        else
            @products << (@products.last * num)
        end
    end

    def get_product(k)
        @products.size > k ? (@products.last / @products[-k-1]) : 0
    end
end
