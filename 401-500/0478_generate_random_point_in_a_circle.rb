# https://stackoverflow.com/questions/5837572/generate-a-random-point-within-a-circle-uniformly

class Solution
    def initialize(radius, x_center, y_center)
        @radius = radius
        @x_center = x_center
        @y_center = y_center
    end
    
    # CDF(x) = ∫2x = x^2
    # Swap:   x = y^2
    # CDF-1:  y = sqrt(x)
    def rand_point()
        r = Math.sqrt(rand(0.0..1.0)) * @radius
        theta = rand(0.0..1.0) * 2 * Math::PI
        [@x_center + r * Math.cos(theta), @y_center + r * Math.sin(theta)]
    end
end
