require Dir.pwd + '/app.rb'
require Dir.pwd + '/error.rb'
require Dir.pwd + '/home.rb'

# declare static resources that should be left alone by ruby
use Rack::Static,
  :urls => ["/images", "/js", "/css"]

class AppServer
	def call(env)
		case env['SCRIPT_NAME']
		when '/search';
			a = App.new env
			text = a.html # displays card page
		when '/home';
			h = Home.new env
			text = h.html # displays home page
		end
		[200, {"Content-Type" => "text/html"}, [text]] # gives 200 response
	end
end

class ErrorServer
	def call(env)
		e = Error.new env
		[404, {"Content-Type" => "text/html"}, [e.html]] # gives 404 error and displays error page
	end
end

server = Rack::Builder.new do
	map '/search' do
		run AppServer.new
	end
	
	map '/home' do
		run AppServer.new
	end
  
	map '/' do
		run ErrorServer.new # runs error service class
	end
end
 
run server