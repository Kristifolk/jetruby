require "rack"
require "./cashmachine"

class App

    def initialize
        @cash = CashMachine.new
        @cash.init 
    end

	def call(env)
        req = Rack::Request.new(env)
    
        params = req.query_string.split("&").map{ |pair| pair.split("=") }.to_h
       
        router(req.path, params)
	end

    def router(path, params)
        case path
        when "/"
            [200, {'Content-Type' => 'text/html'}, ["Hello, word!"]]
        when "/user"
            [200, {'Content-Type' => 'text/html'}, ["Hello, user!"]]
        when "/balance"
            result = @cash.balance
            [200, {'Content-Type' => 'text/html'}, [result]]
        when "/deposit"
            result = @cash.deposit(params['value'])
            [200, {'Content-Type' => 'text/html'}, [result]]
        when "/withdraw"
            result = @cash.withdraw(params['value'])
            [200, {'Content-Type' => 'text/html'}, [result]]
        #на заметку: можно прикрутить html документ
        #when "/about"
        #    [200, {'Content-Type' => 'text/html'}, File.readlines('index.html')]
        else
            [404, {'Content-Type' => 'text/html'}, ["Not found"]]
        end
    end

end
