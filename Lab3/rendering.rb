module Rendering
    class Font
        attr_accessor :name, :weight, :size
        def initialize(name, weight =:normal, size = 10)
            @name = name
            @weight = weight
            @size = size
        end
    end

    class PaperSize
        attr_accessor :name, :width, :height
        def initialize(name = "Us Letter", width = 8.5, height = 11.0)
            @name = name
            @width = width
            @height = height
        end
    end
end