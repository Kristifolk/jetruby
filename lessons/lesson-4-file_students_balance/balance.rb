#Задание 3
=begin
Программа начинается с чтения банковского баланса клиента из файла "balance.txt"
Этот файл содержит одну строку со стартовым балансом клиента. Если файл не существует,
стартовый баланс 100.0, который должен быть константой.
Программа предалагает клиенту внести деньги, вывести деньги, проверить баланс или выйти,
используя буквы D (deposit), W(withdraw), B(balance), Q(quit).
Программа принимает на вход значения в верхнем или нижнем регистре.
Для депозитов (D), программа подсказывает сумму. Сумма должна быть больше нуля.
 Если сумма действительна, программа добавляет сумму депозита к балансу клиента и отображает новый баланс.
При снятии средств (W) программа выдаст запрос на сумму. Сумма должна быть больше нуля 
и меньше или равна текущему балансу. Если сумма корректна, то программа вычитает сумму 
вывода из баланса клиента и отображает новый баланс.
Для проверки баланса (B) программа просто выводит текущий баланс.
Когда клиент решит выйти из программы (Q), программа запишет текущий баланс обратно в файл balance.txt.
В случае неправильного ввода (команда или сумма), ваша программа должна выдать 
соответствующее сообщение об ошибке, которое говорит клиенту, как ее исправить. Нельзя просто выводить "Error!" - это не поможет.

=end
FILE = "balance.txt"
CURRENT_BALANCE =  File.exist?(FILE) ? File.read(FILE).split("\n") : "null"

def start
    if File.exist?(FILE)
        @current_balance = File.read(FILE)
        puts "Баланс " + @current_balance
        question
    else
        File.write("balance.txt", "100.0")
        @current_balance = File.read("balance.txt")
        puts "Баланс " + @current_balance
        question
    end 
end 

def question
    puts "Что желаете?
        внести деньги: D
        вывести деньги: W
        проверить баланс: B
        выйти: Q" 
    @user_letter = gets.chomp.downcase
    #Проверка на ввод одной англ. буквы "d" || "b" || "q" || "w"
    #Как компактнее записать условие?
    if (@user_letter.length == 1 && @user_letter.match?(/[A-Za-z]/))#рег.выражение Это англ.буква? почему не работает .is_alphabetic?
        if @user_letter === "d" || @user_letter === "b" || @user_letter === "q" || @user_letter === "w"
            @atm_operations =  @user_letter
            atm
        else
            puts "Ошибочный ввод данных.
        Попробуйте снова, переключите на английскую раскладку на клавиатуре.
        Далее введите соответствующую букву"
            question
        end
    else
        puts "Ошибочный ввод данных.
        Попробуйте снова, переключите на английскую раскладку на клавиатуре.
        Далее введите соответствующую букву"
        question
    end
    return
end

def atm
    case @atm_operations
    when "d"
        deposit    
        question
    when "w"
        withdraw
        question       
    when "b"
        balance
        question  
    question
    else "q"
        quit
    end
end

#пользовательский ввод положительное число целое или с плавающей точкой 
def numeric?(value)
    Integer(value) rescue false
  end
  
def float?(value)
    Float(value) rescue false
end

def deposit
    puts 'Какую сумму вы желаете внести? Например 100.50 или 1000'
    user_response = gets.chomp.to_s
    if (numeric?(user_response) && user_response.to_i > 0) || (float?(user_response)  && user_response.to_f > 0.0) 
        puts "Сумма \'#{user_response.to_f.round(2)}\'  успешно внесена"
        @current_balance = (@current_balance.to_f + user_response.to_f.round(2)).round(2)
        puts @current_balance #Не выводить @current_balance ввести Q
    else  
        puts "Некорректный ввод суммы. Необходимо положительное число" 
        deposit
    end   
end

def withdraw
    puts 'Какую сумму вы желаете снять. Например 100.50 или 1000'
    user_response = gets.chomp.to_s
    if (numeric?(user_response) && user_response.to_i > 0) || (float?(user_response)  && user_response.to_f > 0.0)
         if user_response.to_f <= @current_balance.to_f
            puts "Сумма \'#{user_response.to_f.round(2)}\'  успешно cнята"
            @current_balance = (@current_balance.to_f - user_response.to_f.round(2)).round(2)
            puts @current_balance #Не выводить @current_balance ввести Q
         else
            puts "Недостаточно средств. Текущий баланс \'#{@current_balance}\' Введите другую сумму" 
        withdraw
         end        
    else  
        puts "Некорректный ввод суммы. Необходимо положительное число" 
        withdraw
    end   
end

def balance
    puts "Баланс " + @current_balance   
end

def quit
    File.write(FILE, @current_balance)
end

start

