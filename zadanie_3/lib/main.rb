require 'curses'

def get_menus
    return [
        "Dodaj",
        "Odejmij",
        "Podziel",
        "Pomnoz",
        "Logartym",
        "Calkowanie"
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

def set_box(y1, x1, y2, x2)
    win1 = Curses::Window.new(y1, x1, y2, x2)
    win1.box("|", "-")
    win1.refresh
    return win1
end

def close_box(box)
    box.clear
    box.refresh
    box.close
end

def initialize_menu(box)
    menupos = 1
    direction = 0
    draw_menu(1, box)
    menu_count = get_menus().length

    loop do
        input = box.getch
        box.clear
        box.box("|", "-")

        case input
        when Curses::Key::UP
            direction = -1
        when Curses::Key::DOWN
            direction = 1
        else
            
        end

        menupos = (menupos + direction) % (menu_count + 1)

        case menupos
        when 1..menu_count
            draw_menu(menupos, box)
        else
            if (1 == direction)
                draw_menu(1, box)
            else
                draw_menu(menu_count, box)
            end
            
            menupos = menupos + direction
        end

        box.setpos(15,15)
        box.addstr("Y value: #{menupos}")
        box.refresh
        break if input == 27
    end
    box.refresh
end

#Main:

Curses.init_screen
Curses.start_color
begin
    win1 = set_box(0,0,1,1)
    win1.keypad= true
    initialize_menu(win1)
ensure
    close_box(win1)
    Curses.close_screen
end











def sum(x,y)
    return x+y
end

def multiplication(x,y)
    return x*y
end

def divide(x,y)
    if y == 0
        return "Error"
    end
    return x/y
end

def diffrence(x,y)
    return x-y
end
