#Задание 1
#Написать скрипт, который будет принимать слово, если слово 
#заканчивается на “CS” (в любом регистре) - выводит на экран 
#цифру 2 в степени (длины введенного слова), если не заканчивается
# - выводит слово задом наперед
def cs_ending(word)
    if word.slice(-2,2).downcase == "cs"
        puts 2**word.length
    else
        puts word.reverse
    end
end
cs_ending("YellowCS")

 #Задание 2
#Написать скрипт, который будет выводить массив покемонов. 
#Спросит сколько добавить покемонов
#Указанное на предыдущем этапе число раз спросит имя и цвет каждого покемона
#Выведет в консоль массив содержащий хеши покемонов в формате
#[{ name: ‘Pikachu’, color: ‘Yellow’ }, … n times{}]
 def pokemon
    puts "Привет, сколько добавить покемонов?"
    quantity = gets.chomp.to_i
    while quantity < 1
        puts "Пожалуйста, введите положительное число покемонов"
        quantity = gets.chomp.to_i
    end
    hash_pokemons = []
    n = 1
    while n <= quantity
        your_pokemons = {}
        puts "Скажи, как зовут твоего покемона #{n}?"
        name = gets.chomp 
        puts "Какого цвета покемон #{n}?"
        color = gets.chomp
        your_pokemons[:name] = name
        your_pokemons[:color] = color
        hash_pokemons << your_pokemons
        n += 1
    end
    p hash_pokemons
end
pokemon



   
