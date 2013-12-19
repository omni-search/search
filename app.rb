require Dir.pwd + '/cards.rb'

class App
	def initialize(env)
		@env = env
	end
	
	def html()
		request = Rack::Request.new @env
		searchterm = request.params[:q]
		string = '<html><head><!--stuff--></head></body>'
		cards = Cards.getCards searchterm
		cards.each do |card|
			string += card
		end
		string += '</body></html>'
	end
	def error()
	  "<h1> ERROR. Please Try Again</h1>"
	end
end