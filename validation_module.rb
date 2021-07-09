module Validation_attr
    def string_validate(data)
        string?(data) == true ? data : (raise "('#{data}') no es un valor válido. Se require String")
    end

    def integer_validate(data)
        integer?(data) == true ? data : (raise "('#{data}') no es un valor válido. Se require Integer")
    end

    def string?(data)
        data.class == String
    end

    def integer?(data)
        data.class == Integer
    end
end