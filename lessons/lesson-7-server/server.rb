#lesson-7-http по вашей нумерации  lesson-6

=begin
Задание 1
 Переписать банкомат из ЛЗ #4 (класс CashMachine) на работу с веб сервером. 
Необходимо заменить ввод и вывод данных (по условию изначальной задачи) на запросы, вместо работы с консолью.

GET /deposit?value=
GET /withdraw?value=
GET /balance

=end

require 'socket'
server = TCPServer.new('0.0.0.0', 3001)#

while connection = server.accept
    request = connection.gets#запрос Get

    method, full_path, protocol = request.split(" ")#ПРи выводи разделить данные выводить с новой строки GET /user HTTP/1.1 
    
    path, params = full_path.split("?")

    puts method
    puts path
    puts protocol
    puts params

    response = case path
    when "/"
        "Hello, word!"
    when "/user"
        "Hello, user!"
    else
        "404"
    end

    status = response == "404" ? "404" : "200" #если 404 вернуть 404 иначе 200


    puts "Сервер запущен"#удалить
  #request = connection.gets
  #method, full_path = request.split(' ')
  #path = full_path.split('?')[0]

  connection.print "HTTP/1.1 #{status}\r\n "#версия, код
  connection.print "Content-Type: text/html\r\n"
  connection.print "\r\n"# пустая строка
  connection.print response

  connection.close
end
