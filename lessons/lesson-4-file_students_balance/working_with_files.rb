#Задание 1. Написать набор методов для работы с файлом

FILE = "students.txt"
#index выводит все строки
def index(file = FILE)
    if File.exist?(file)
        original_file = File.open(file)
        file_data = original_file.readlines.map(&:chomp)
        original_file.close
        file_data
    else 
        "Error. file \'#{file}\' not found"
    end
end

#find(id) находит кокретную строку в файле и выводит ее
def find(id,file = FILE)
    if File.exist?(file)
        IO.readlines(file)[id]
    else 
        "Error. file \'#{file}\' not found"
    end
end

#where(pattern) находит все строки,где есть указанный паттерн
def where(pattern,file = FILE)
    if File.exist?(file)
        File.foreach(file) do |student|
            if  student.include?(pattern)
                puts student
            else 
                puts "Error.  \'#{pattern}\' not found"
                return 
            end
        end
    else 
        "Error.  file \'#{file}\' not found"
    end  
end

#update(id, text) обновляет конкретную строку файла
def update(id,text,file = FILE)
    if File.exist?(file)
        buffer_file = File.open("buffer.txt", 'w')
            File.foreach(file).with_index do |student, index|
                buffer_file.puts(id == index ? text : student)
            end
        buffer_file.close
        File.write(file, File.read("buffer.txt")) 
        File.delete("buffer.txt") if File.exist?("buffer.txt")  
    else 
        "Error.  file \'#{file}\' not found"
    end
end

#delete(id) удаляет строку
def delete(id,file = FILE)
    if File.exist?(file)
        file_data = File.readlines(file)
        if id.between?(0, file_data.length - 1)
            string_to_delete = file_data.delete_at(id) 
            pp string_to_delete
            File.open(file, "w") do |f|
                f.puts(file_data)
            end
        else
            "Недопустимый индекс: #{id}" 
        end
    else 
        "Error.  file \'#{file}\' not found"
    end 
end

#create(name)добавляет строку в конце файла
def create(name,file = FILE)
    if File.exist?(file)
        original_file = File.open(file)
        File.write(file,"\n#{name}",mode:"a")
        file_data = original_file.readlines.map(&:chomp)
        original_file.close
        file_data #надо ли выводить обновленный массив?
    else 
        "Error. file \'#{file}\' not found"
    end
end

#p students
#p index("students.txt")
#p find(9)
p where("И")
#p update(7,"Мира Мировая 40")
#p delete(2)
#p create("Фродо Федотов 36")
#p file_data = File.read("students.txt").split("\n")


