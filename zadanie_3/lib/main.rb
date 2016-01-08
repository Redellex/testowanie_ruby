require 'curses'
require './calc.rb'

$value_x = 0
$value_y = 0
$which_value = 0
$czy_zostal_wybrany_znak = false
$zatwierdzona_opcja = 0
$result = 0

def reset(calc_box, result_box)
    calc_box.clear
    result_box.clear
    calc_box.box("|", "-")
    result_box.box("|", "-")
    $value_x = 0
    $value_y = 0
    $which_value = 0
    $czy_zostal_wybrany_znak = false
    $zatwierdzona_opcja = 0
    $result = 0
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
        $result = silnia($value_x)
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
    when 5
        $result = power($value_x, $value_y)
    end
end

def wybrana_opcja(y, calc_box, number_position)
    calc_box.setpos(1, 1 + number_position)
    $czy_zostal_wybrany_znak = true
    case y
    when 1
        calc_box.addstr('+')
    when 2
        calc_box.addstr('-')
    when 3
        calc_box.addstr('/')
    when 4
        calc_box.addstr('*')
    when 5
        calc_box.addstr('^')
    when 6
        calc_box.addstr('!')
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
        if $zatwierdzona_opcja == 7
            reset(calc_box, result_box)
        end
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
