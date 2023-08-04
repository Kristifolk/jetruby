#Задание 2
=begin
 Есть файл "students.txt": имя, фамилия, возраст
 Необходимо прочитать файл, затем запросив у пользователя ввод возраста,найти
 в результатах чтения файла, студента чей возраст равен 
 введенному числу и записать этого студента(тов) в другой файл с названием 
 "results.txt". После этого перезапросить ввод. 
 Программа завершается выводом на экран содержимого файла "results.txt" посторочно,
 если все студенты из первого файла были записаны во второй или если пользователь 
 ввел с клавиатуры -1
=end
FILE_students = "students.txt"
FILE_RESULTS = "results.txt"
def start
    if File.exist?(FILE_students)
        @arr_students = IO.readlines(FILE_students)
        @arr_students_scan =  @arr_students
        students
    else 
        "Error. file \'#{FILE_students}\' not found"
    end 
end 

#распечатать файл "results.txt"
def print_results_file 
    results_file = File.open(FILE_RESULTS)
    pp results_file.readlines.map(&:chomp)
    results_file.close
end   

#запрос возраста студента
def age_student    
    puts "Введите возраст студента. Для завершения программы введите -1"
    @age_correct = gets.chomp.to_i
    if @age_correct === -1
        pp "print_results_file из age_student"#удалить pp после решения проблемы
        print_results_file
        #return break не подходит.Как остановить метод students ? и не выводить второй раз массив из print_results_file
    elsif @age_correct < 1 #$age_correct.zero?|| age_correct < 0
        puts "Некорректный ввод возраста. Необходимо положительное число."
        age_student
    #Проверка на существование такого возраста
    else 
        @arr_students = IO.readlines(FILE_students)
        @age = @age_correct
        if (!@arr_students.grep(/#{@age}/).empty? && @arr_students_scan.grep(/#{@age}/).empty?)
            p "Студенты возрастом #{@age} уже в файле \'#{FILE_RESULTS}\'"
        elsif (@arr_students.grep(/#{@age}/).empty? && @arr_students_scan.grep(/#{@age}/).empty?)
            p "Студента возрастом #{@age} нет в файле \'#{FILE_students}\'"
        elsif (!@arr_students.grep(/#{@age}/).empty? && !@arr_students_scan.grep(/#{@age}/).empty?)
        p "Возраст подходит"#Нужна ли запись "Возраст подходит"
        else
        p "1011"#удалить pp после решения проблемы
        end
    end   
end

def students
    i = 1
    while i <= @arr_students_scan.length 
        age_student
        break if @age_correct === -1
        a = @age.to_s 
        @arr_students_scan.each do |item|
            if item.include?(a)
                #такой возраст есть в @arr_students, удалить в @arr_students_scan, записать в FILE_RESULTS
                @arr_students_scan.delete(item)
                create(item)
            else
                i -= 1
            end
        end
        i += 1
        break if @arr_students_scan.length === 0
    end
    p "print_results_file Из students: "
    print_results_file  
    
end

def create(str) #дозаписываю студентов
    File.open(FILE_RESULTS,"a") do |f|  
        f.puts(str) 
    end
end 

start
