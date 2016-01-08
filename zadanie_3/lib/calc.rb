def get_menus
    return [
        "Dodaj",
        "Odejmij",
        "Podziel",
        "Pomnoz",
        "Potegowanie",
        "Silnia",
        "Reset"
    ]
end

def set_box(y1, x1, y2, x2)
    win1 = Curses::Window.new(y1, x1, y2, x2)
    win1.box("|", "-")
    win1.refresh
    return win1
end

def draw_menu(position, box)
    x = box.maxx / 2
    y = box.maxy / 2
    left_margin = x - 2
    menus = get_menus()
    elements_count = menus.length
    current_pos = 0

    menus.each { |menu_name|
        top_margin = y - (elements_count - current_pos)
        box.setpos(top_margin, left_margin)

        if current_pos == (position - 1)
            box.addstr("> #{menu_name} <")
        else
            box.addstr("  #{menu_name}  ")
        end

        current_pos += 1
    }
end

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
    if not y.is_a?
       return "Error, value not integer. "
    end
    if y == 0
        return 1
    end

    if y > 0
        for i in 1..y
            x = x*x
        end
    return x
    end
    if y < 0
      for i in range 1..(-y)
        x = x*x
      end
      return 1/x
    end
    return "Undefined error"
end

def silnia(x)
    if not x.is_a?
        return "Error, value not integer."
    end
    if x < 2
        return 1
    end
    return x*silnia(x-1)
end
