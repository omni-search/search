require Dir.pwd + '/cards.rb'

class App
	def initialize(env)
		@env = env
	end
	
	def html()
		request = Rack::Request.new @env
		searchterm = request.params['q']
		#return request.params.inspect
		string = '<html>
			<head>
				<link rel="stylesheet" type="text/css" href="/css/cards.css">
			</head>
			<body>'
		if !searchterm
			string += 'You gave no searchterm'
		else 
			cards = Cards.getCards searchterm # get all cards
			cards.each do |card|
				string += card
			end
		end
		string += '</body></html>'
	end
	def error()
	  '<title> Oh Snap!</title>
	  <h1> 404</h1>
	  <h1> Unfortunatly the page you were looking for is not on this server</h1>
	  <h1> Maybe you were looking for <a href="/search">this?</a></h1>'# shows error page
	end
end