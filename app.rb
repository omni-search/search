require Dir.pwd + '/cards.rb'
require Dir.pwd + '/commonhtml.rb'

class App
	def initialize(env)
		@env = env
	end
	
	def html()
		request = Rack::Request.new @env
		searchterm = request.params['q']
		#return request.params.inspect
		string = '<html>' + CommonHTML.getHead(cards = true) # get head, including cards elements
		
		if searchterm.length < 1
			string += '<script> alert("You didnt search for anything")</script>'
			string += '<script> window.location.href = "/home";</script>'
		else 
		  string += '<body>' + CommonHTML.getHeader(searchPreload = searchterm) # get the header bar, and add the preloaded search value
			cards = Cards.getCards searchterm # get all cards
			cards.each do |card|
				string += card
			end
		end
		string += '</body></html>'
	end
end