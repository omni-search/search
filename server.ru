require Dir.pwd + '/app.rb'


class AppServer
	def call(env)
		a = App.new env
		[200, {"Content-Type" => "text/html"}, [a.html]] # gives 200 response and displays card page
	end
end

class ErrorServer
	def call(env)
		a = App.new env
		[404, {"Content-Type" => "text/html"}, [a.error]] # gives 404 error and displays error page
	end
end

server = Rack::Builder.new do
	map '/search' do
		run AppServer.new
	end
  
	map '/' do
		run ErrorServer.new # runs error service class
	end
end
 
run server