require 'curses'

$value_x = 0
$value_y = 0
$which_value = 0
$czy_zostal_wybrany_znak = false
$zatwierdzona_opcja = 0
$result = 0

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

def power(x,y)
    for i in 1..y
        x = x*x
    end
    return x
end

def silnia(x)
    if x < 2
        return 1
    end
    return x*silnia(x-1)
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

def put_numbers(calc_box, position)
    case $which_value
    when 0
        calc_box.setpos(1,(position + 1))
        number = calc_box.getstr()
        position += number.length + 1
        $value_x = number.to_i
        calc_box.addstr($value_x.to_s)
        $which_value +=1
        calc_box.refresh
        return position
    when 1
        if $czy_zostal_wybrany_znak
            calc_box.setpos(1,(position + 3))
            number = calc_box.getstr()
            position += number.length + 1
            $value_y = number.to_i
            calc_box.addstr($value_y.to_s)
            $which_value +=1
            do_calc()
            calc_box.refresh
        end
        return position
    else 
        return position
    end
end

def show_result(result_box, result)
    result_box.setpos(1,1)
    result_box.addstr($result.to_s)
end

def do_calc()
    case $zatwierdzona_opcja
    when 1
        $result = sum($value_x, $value_y)
    when 2
        $result = diffrence($value_x, $value_y)
    when 3
        $result = divide($value_x, $value_y)
    when 4
        $result = multiplication($value_x, $value_y)
    end
end

def wybrana_opcja(y, calc_box, number_position)
    case y
    when 1
        calc_box.setpos(1, 1 + number_position)
        calc_box.addstr('+')
        $czy_zostal_wybrany_znak = true
    when 2
        calc_box.setpos(1, 1 + number_position)
        calc_box.addstr('-')
        $czy_zostal_wybrany_znak = true
    when 3
        calc_box.setpos(1, 1 + number_position)
        calc_box.addstr('/')
        $czy_zostal_wybrany_znak = true
    when 4
        calc_box.setpos(1, 1 + number_position)
        calc_box.addstr('*')
        $czy_zostal_wybrany_znak = true
    end
    $zatwierdzona_opcja = y
end

def initialize_menu(box)
    menupos = 1
    direction = 0
    number_position = 0
    draw_menu(1, box)
    menu_count = get_menus().length
    calc_box = set_box(3,70, 35,15)
    result_box = set_box(3,70,40,15)
    loop do
        input = box.getch
        box.clear
        box.box("|", "-")
        calc_box.box("|", "-")
        result_box.box("|","-")
        show_result(result_box, $result)
        case input
        when Curses::Key::UP
            direction = -1
        when Curses::Key::DOWN
            direction = 1
        when 'x'
            wybrana_opcja(menupos, calc_box, number_position)
        when '0', '1', '2', '3', '4', '5', '6', '7' ,'8', '9'
            direction = 0
            number_position = put_numbers(calc_box, number_position)
        else 
            direction = 0
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
            if menupos == -1 
                menupos=menu_count
            end
        end

        box.setpos(15,15)
        box.addstr("Y value: #{menupos}")
        box.refresh
        calc_box.refresh
        result_box.refresh
        break if input == 27
    end
    close_box(calc_box)
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
