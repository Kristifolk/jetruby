# Задание 1
def greeting
    print "Введите Ваше имя: "
    name = gets.chomp 
    print "Введите Вашу фамилию: "
    surname = gets.chomp
    print "Введите Ваш возраст: "
    age = gets.chomp.to_i
    if age < 18
        puts "Привет, " + name +" "+ surname + ". Тебе меньше 18 лет, но начать учиться программировать никогда не рано" 
    else
        puts "Привет, " + name +" "+ surname + ". Самое время заняться делом!"
    end
end
greeting

# Задание 2
def foobar
    print("Введите первое число: ")
    x = gets.chomp.to_i
    print("Введите второе число: ")
    y = gets.chomp.to_i
    if x == 20
        puts y
    elsif y == 20
        puts x
    else
        puts x + y
    end
end
foobar

# Себе на заметку
# .chomp() удалит последний символ enter
# .to_i из gets получаем данные в виде строки string и переводим в число integer, если .to_f то float