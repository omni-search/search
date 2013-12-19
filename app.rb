require Dir.pwd + '/cards.rb'

class App
	def initialize(env)
		@env = env
	end
	
	def html()
		request = Rack::Request.new @env
		searchterm = request.params['q']
		#return request.params.inspect
		string = '<html><head><!--stuff--></head></body>'
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
	  "<h1> ERROR. Please Try Again</h1>"
	end
end