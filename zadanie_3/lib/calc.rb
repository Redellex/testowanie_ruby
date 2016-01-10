def sum(x,y)
    return x+y
end

def multiplication(x,y)
    return x*y
end

def divide(x,y)
    if y == 0
        return "Error, don't divide by 0."
    end
    return x/y
end

def diffrence(x,y)
    return x-y
end

def power(x,y)
    if not y.is_a? Integer
       return "Error, value not integer. "
    end
    if y == 0
        return 1
    end

    if y > 0
        for i in 2..y
            x = x*x
        end
    return x
    end
    if y < 0
      for i in range 2..(-y)
        x = x*x
      end
      return 1/x
    end
    return "Undefined error"
end

def silnia(x)
    if not x.is_a? Integer
        return "Error, value not integer."
    end
    if x < 2
        return 1
    end
    return x*silnia(x-1)
end
