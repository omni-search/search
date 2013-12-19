require Dir.pwd + '/app.rb'
require Dir.pwd + '/home.rb'

class AppServer
	def call(env)
		a = App.new env
		[200, {"Content-Type" => "text/html"}, [a.html]]
	end
end

class ErrorServer
	def call(env)
		h = Home.new env
		[200, {"Content-Type" => "text/html"}, [h.html]]
	end
end

server = Rack::Builder.new do
	map '/search' do
		run AppServer.new
	end
  
	map '/' do
		run ErrorServer.new
	end
end
 
run server