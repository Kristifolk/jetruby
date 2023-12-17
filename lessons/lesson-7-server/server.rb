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
require 'rack/utils'# ?
require './app'

app = App.new

server = TCPServer.new('0.0.0.0', 3002)

while connection = server.accept
    request = connection.gets

    method, full_path = request.split(" ")#ПРи выводи разделить данные выводить с новой строки GET /user HTTP/1.1 
    
    path, params = full_path.split("?")

    #params = params.split("&").map{ |pair| pair.split("=") }.to_h

#    puts method
#    puts path
#    puts protocol
#    puts params

status, headers, body, = app.call({
    "REQUEST_METHOD" => method,
    "PATH_INFO" => path,
    "QUERY_STRING" => params
})

#    response = router(path, params)
#    status = response == "404" ? "404" : "200" #если 404 вернуть 404 иначе 200/Убрали так как status будет возращаться rack приложением

  connection.print "HTTP/1.1 #{status}\r\n "#версия, статус код
  headers.each do |key, value|
    connection.puts "#{key}: #{value}; charset=UTF-8\r\n" #кодировка русский текст неработает :(
  end
  connection.print "\r\n"# пустая строка
  body.each do |part|
    connection.print part
  end

  connection.close
end
