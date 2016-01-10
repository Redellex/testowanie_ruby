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
