#Задание 2 lesson-5-class_CashMachine (Нумерация lesson-5 с учетом первой лекции с GIT)
=begin
Урок 4. Задание #2
Исходный код
https://gist.github.com/AlxGolubev/b30af07fe3a0add200d1c693ac64133f
Пользователь запускает программу и отвечает на вопрос, с каким ресурсом он хочет взаимодействовать
- После чего он может передать тип запроса GET/POST/PUT/DELETE
    - GET index - должен возвращать все посты из памяти и их индекс в массиве (прим. 0. Hello World \n 1. Hello (again))
    - GET show - должен запрашивать идентификатор поста и показывать пост по переданному идентификатору (как в index только 1 пост)
    - POST create - должен запрашивать текст поста, добавлять его в массив постов и возвращать в ответ идентификатор поста и сам пост
    - PUT update - должен запрашивать идентификатор поста, потом новый текст поста и заменить его. В результате выводить пост (как в экшене index)
    - DELETE destroy - должен запрашивать идентификатор поста, затем удалять его из массива постов
Нужно реализовать логику для PostsController
В отчете по заданию расписать, понимание работы класса Router, причины, по которым используется extend для модуля Resource. Cмотри readme.mb
В случае неправильного ввода (команды), ваша программа должна выдать соответствующее сообщение об ошибке, которое говорит клиенту, как ее исправить. Нельзя просто выводить "Error!" - это не поможет.
=end

module Resource
  def connection(routes)
    if routes.nil?#Если соединение отсутствует,то вывести сообщение
      puts "No route matches for #{self}"# self - это ссылка на текущий объект, тк подключен к классу то выведет класс PostsController
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil # action не содержит никакого значения

      if verb == 'GET' # если входим в это условие, пользователь выбрал GET, то action = ввод пользователя index/show
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end
      #pp "routes: #{routes[verb]}"
      # Если action = nil то вызов процедуры routes[verb].call иначе вызов процедуры routes[verb][action].call
      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
  
end
  
class PostsController
  extend Resource #подключается в класс PostsController Модуль Resource

  def initialize
    @posts = [] #['Hello World', 'Hello (again)', 'Have a good day', 'You can do it']
  end

  def no_posts
    if @posts.length == 0
      puts "Тhere are no posts. Сreate a post"
      return false
    end
  true    
  end

  #должен возвращать все посты из памяти и их индекс в массиве (прим. 0. Hello World \n 1. Hello (again))
  def all_posts_and_id  
    no_posts
    if @posts.length > 0
      for i in 0..@posts.length - 1
        puts "#{i}. #{@posts[i]}"
      end
    end   
  end 

  #должен запрашивать идентификатор поста
  def request_post_id 
    puts "Enter the id of the post"
    @id_post = gets.chomp.to_i      
    if (@id_post < 0 || @id_post >= @posts.length)
      puts "No post with this id #{@id_post}. Enter a number of post id in the range from 0 to #{@posts.length - 1}"
      request_post_id 
    elsif @posts.length == 0
        no_posts 
    end
      return @id_post
  end

  #показывать пост по переданному идентификатору (как в index только 1 пост)
  def show_post_id(id)
    if (id >= 0 && id < @posts.length)
      for i in 0..@posts.length - 1
      puts "#{id}. #{@posts[id]}"
      return #
      end
    end  
  end

  def request_post_id_show_it #может метод избыточен и вся логика должна быть в show?
    if no_posts == false
      return 
    else
      request_post_id 
      show_post_id(@id_post)
      return
    end 
  end 

  #должен запрашивать текст поста
  def request_text
    puts "Enter text for post"
    @text_post = gets.chomp.to_s
  end

  #GET index - должен возвращать все посты из памяти и их индекс в массиве (прим. 0. Hello World \n 1. Hello (again))
  def index 
    puts 'index'
    all_posts_and_id #может метод избыточен и вся логика должна быть в index?
     
  end
  #GET show - должен запрашивать идентификатор поста и показывать пост по переданному идентификатору (как в index только 1 пост)
  def show 
    puts 'show'   
    request_post_id_show_it
  end

  def create #...POST create - должен запрашивать текст поста, добавлять его в массив постов и возвращать в ответ идентификатор поста и сам пост
    puts 'create'
    @posts.push(request_text)
    last_index = @posts.length - 1
    show_post_id(last_index)
  end

  def update #...PUT update - должен запрашивать идентификатор поста, потом новый текст поста и заменить его. В результате выводить пост (как в экшене index)
    puts 'update'
    if @posts.length > 0
      @posts[request_post_id] = request_text
      all_posts_and_id
    else
      no_posts
    end
  end

  def destroy #...DELETE destroy - должен запрашивать идентификатор поста, затем удалять его из массива постов
    puts 'destroy'   
    if @posts.length > 0
      @posts.delete_at(request_post_id)
      puts "Post deleted"
    else
      no_posts
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp      
      PostsController.connection(@routes['posts']) if choise == '1' #Метод connection из модуля Resource подключен методом extend в класс PostsController(доступен классу, а не экземплярам класса)
      break if choise == 'q'
    end
    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),#.method который вернет ссылку
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init

 