=begin
#lesson-7-http по вашей нумерации lesson-6
Задание 1
 Переписать банкомат из ЛЗ #4 (класс CashMachine) на работу с веб сервером. 
Необходимо заменить ввод и вывод данных (по условию изначальной задачи) на запросы, вместо работы с консолью.
GET /deposit?value=
GET /withdraw?value=
GET /balance
=end

=begin
из ЛЗ #4
lesson-5-class_CashMachine (Нумерация lesson-5 с учетом первой лекции с GIT) 
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

class CashMachine
    attr_accessor :file
    FILE = "balance.txt"
    STARTING_BALANCE = "100" 

    def initialize(file = FILE)
        File.exist?(FILE) ? File.read(FILE).split("\n") : STARTING_BALANCE # если FILE = "balance.txt" не существует, стартовый баланс 100.0
        @file = file
    end

    def init
        if File.exist?(@file)
            @current_balance = File.read(@file)
            "Balance " + @current_balance
        else
            File.write("balance.txt", STARTING_BALANCE)
            @current_balance = File.read("balance.txt")
            "Balance " + @current_balance
        end 
    end 

    def deposit(value)#внести деньги 
        user_response = value
        if (numeric?(user_response) && user_response.to_i > 0) || (float?(user_response)  && user_response.to_f > 0.0) 
            @current_balance = (@current_balance.to_f + user_response.to_f.round(2)).round(2)
            File.write(@file, @current_balance)
            "The amount of \'#{user_response.to_f.round(2)}\' has been successfully deposited, current balalnce #{@current_balance}" #"Сумма \'#{user_response.to_f.round(2)}\'  успешно внесена, current balalnce #{@current_balance}"
        else  
            "Invalid amount entered. Requires a positive number,for example: deposit?value=100" #"Некорректный ввод суммы. Необходимо положительное число" 
        end   
    end

    def withdraw(value)#снятиe средств
        user_response = value
        if (numeric?(user_response) && user_response.to_i > 0) || (float?(user_response)  && user_response.to_f > 0.0)
            if user_response.to_f <= @current_balance.to_f
                @current_balance = (@current_balance.to_f - user_response.to_f.round(2)).round(2)
                File.write(@file, @current_balance)
                "Amount \'#{user_response.to_f.round(2)}\'successfully withdrawn, current balalnce #{@current_balance}" # сумма успешно cнята
            else
                "Insufficient funds. Current balance \'#{@current_balance}\' Enter a different amount " #"Недостаточно средств. Текущий баланс \'#{@current_balance}\' Введите другую сумму"
            end        
        else  
           "Invalid amount entered. Requires a positive number, for example: withdraw?value=100" # "Некорректный ввод суммы. Необходимо положительное число" 
        end   
    end

    def balance
        "Balance #{@current_balance} " 
    end
   
    #пользовательский ввод положительное число целое или с плавающей точкой 
    def numeric?(value)
        Integer(value) rescue false
    end
    
    def float?(value)
        Float(value) rescue false
    end

end



